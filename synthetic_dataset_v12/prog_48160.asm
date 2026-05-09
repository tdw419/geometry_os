; DESCRIPTION: Draws a green line from (490, 194) to (195, 60).
; PLAN: r0=490(x1), r1=194(y1), r2=195(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 194
LDI r2, 195
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
