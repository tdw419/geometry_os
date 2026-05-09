; DESCRIPTION: Creates a green rectangular region at (204, 20) spanning 112 by 85 pixels.
; PLAN: r0=204(x), r1=20(y), r2=112(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 20
LDI r2, 112
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
