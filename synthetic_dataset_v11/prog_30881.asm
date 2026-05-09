; DESCRIPTION: Creates a cyan rectangular region at (105, 54) spanning 115 by 81 pixels.
; PLAN: r0=105(x), r1=54(y), r2=115(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 54
LDI r2, 115
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
