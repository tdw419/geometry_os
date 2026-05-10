; DESCRIPTION: Renders a purple line between points (207, 206) and (101, 195).
; PLAN: r0=207(x1), r1=206(y1), r2=101(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 206
LDI r2, 101
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
