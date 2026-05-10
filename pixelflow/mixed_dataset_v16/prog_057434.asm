; DESCRIPTION: Creates a cyan rectangular region at (230, 164) spanning 49 by 90 pixels.
; PLAN: r0=230(x), r1=164(y), r2=49(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 164
LDI r2, 49
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
