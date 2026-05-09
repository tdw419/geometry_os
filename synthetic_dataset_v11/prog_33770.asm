; DESCRIPTION: Renders a yellow line between points (176, 181) and (107, 195).
; PLAN: r0=176(x1), r1=181(y1), r2=107(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 181
LDI r2, 107
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
