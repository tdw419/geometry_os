; DESCRIPTION: Draws a purple line from (173, 37) to (207, 192).
; PLAN: r0=173(x1), r1=37(y1), r2=207(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 37
LDI r2, 207
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
