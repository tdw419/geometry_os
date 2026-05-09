; DESCRIPTION: Renders a yellow line between points (368, 1) and (449, 101).
; PLAN: r0=368(x1), r1=1(y1), r2=449(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 1
LDI r2, 449
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
