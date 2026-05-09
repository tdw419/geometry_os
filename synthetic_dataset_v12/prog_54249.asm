; DESCRIPTION: Places a purple line segment connecting (506, 243) to (284, 13).
; PLAN: r0=506(x1), r1=243(y1), r2=284(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 243
LDI r2, 284
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
