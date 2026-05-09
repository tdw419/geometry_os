; DESCRIPTION: Creates a cyan rectangular region at (90, 142) spanning 45 by 92 pixels.
; PLAN: r0=90(x), r1=142(y), r2=45(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 142
LDI r2, 45
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
