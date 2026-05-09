; DESCRIPTION: Draws a purple line from (87, 196) to (237, 176).
; PLAN: r0=87(x1), r1=196(y1), r2=237(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 196
LDI r2, 237
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
