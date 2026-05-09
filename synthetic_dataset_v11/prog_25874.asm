; DESCRIPTION: Draws a purple line from (246, 253) to (195, 210).
; PLAN: r0=246(x1), r1=253(y1), r2=195(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 253
LDI r2, 195
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
