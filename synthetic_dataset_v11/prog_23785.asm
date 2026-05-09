; DESCRIPTION: Draws a purple line from (209, 130) to (189, 221).
; PLAN: r0=209(x1), r1=130(y1), r2=189(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 130
LDI r2, 189
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
