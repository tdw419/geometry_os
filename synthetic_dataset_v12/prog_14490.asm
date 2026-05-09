; DESCRIPTION: Renders a orange line between points (188, 213) and (328, 224).
; PLAN: r0=188(x1), r1=213(y1), r2=328(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 213
LDI r2, 328
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
