; DESCRIPTION: Renders a yellow line segment connecting (35, 45) to (213, 183).
; PLAN: r0=35(x1), r1=45(y1), r2=213(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 45
LDI r2, 213
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
