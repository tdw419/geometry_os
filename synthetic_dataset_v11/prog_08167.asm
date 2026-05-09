; DESCRIPTION: Renders a yellow line between points (191, 109) and (230, 195).
; PLAN: r0=191(x1), r1=109(y1), r2=230(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 109
LDI r2, 230
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
