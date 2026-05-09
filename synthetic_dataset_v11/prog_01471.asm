; DESCRIPTION: Creates a green rectangular region at (63, 19) spanning 81 by 74 pixels.
; PLAN: r0=63(x), r1=19(y), r2=81(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 19
LDI r2, 81
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
