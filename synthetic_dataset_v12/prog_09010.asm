; DESCRIPTION: Creates a cyan rectangular region at (256, 73) spanning 25 by 41 pixels.
; PLAN: r0=256(x), r1=73(y), r2=25(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 73
LDI r2, 25
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
