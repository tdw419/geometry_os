; DESCRIPTION: Creates a green rectangular region at (130, 120) spanning 74 by 112 pixels.
; PLAN: r0=130(x), r1=120(y), r2=74(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 120
LDI r2, 74
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
