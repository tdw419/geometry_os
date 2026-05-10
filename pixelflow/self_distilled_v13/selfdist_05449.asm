; DESCRIPTION: Renders a green rectangular region spanning 70 by 85 at (280, 74).
; PLAN: r0=280(x), r1=74(y), r2=70(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 74
LDI r2, 70
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
