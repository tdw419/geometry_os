; DESCRIPTION: Renders a purple line between points (113, 206) and (264, 207).
; PLAN: r0=113(x1), r1=206(y1), r2=264(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 206
LDI r2, 264
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
