; DESCRIPTION: Creates a blue rectangular region at (36, 81) spanning 75 by 115 pixels.
; PLAN: r0=36(x), r1=81(y), r2=75(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 81
LDI r2, 75
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
