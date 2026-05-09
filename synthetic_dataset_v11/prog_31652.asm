; DESCRIPTION: Draws a purple line from (23, 250) to (215, 192).
; PLAN: r0=23(x1), r1=250(y1), r2=215(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 250
LDI r2, 215
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
