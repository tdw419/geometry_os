; DESCRIPTION: Renders a yellow line segment connecting (63, 130) to (249, 174).
; PLAN: r0=63(x1), r1=130(y1), r2=249(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 130
LDI r2, 249
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
