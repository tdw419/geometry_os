; DESCRIPTION: Renders a yellow line between points (473, 214) and (213, 2).
; PLAN: r0=473(x1), r1=214(y1), r2=213(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 214
LDI r2, 213
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
