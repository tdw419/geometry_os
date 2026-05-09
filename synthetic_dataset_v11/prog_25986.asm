; DESCRIPTION: Creates a cyan rectangular region at (19, 43) spanning 75 by 96 pixels.
; PLAN: r0=19(x), r1=43(y), r2=75(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 43
LDI r2, 75
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
