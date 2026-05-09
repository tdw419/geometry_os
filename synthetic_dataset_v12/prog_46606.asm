; DESCRIPTION: Draws a yellow line from (507, 130) to (132, 120).
; PLAN: r0=507(x1), r1=130(y1), r2=132(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 130
LDI r2, 132
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
