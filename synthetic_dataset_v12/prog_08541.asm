; DESCRIPTION: Places a purple line segment connecting (113, 234) to (217, 50).
; PLAN: r0=113(x1), r1=234(y1), r2=217(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 234
LDI r2, 217
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
