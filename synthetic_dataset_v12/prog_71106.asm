; DESCRIPTION: Draws a purple line from (234, 187) to (386, 254).
; PLAN: r0=234(x1), r1=187(y1), r2=386(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 187
LDI r2, 386
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
