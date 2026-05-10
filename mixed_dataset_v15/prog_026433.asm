; DESCRIPTION: Places a purple line segment connecting (328, 234) to (1, 154).
; PLAN: r0=328(x1), r1=234(y1), r2=1(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 234
LDI r2, 1
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
