; DESCRIPTION: Draws a green line from (338, 56) to (195, 121).
; PLAN: r0=338(x1), r1=56(y1), r2=195(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 56
LDI r2, 195
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
