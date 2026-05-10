; DESCRIPTION: Renders a purple line between points (242, 214) and (455, 22).
; PLAN: r0=242(x1), r1=214(y1), r2=455(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 214
LDI r2, 455
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
