; DESCRIPTION: Draws a green line from (511, 56) to (80, 236).
; PLAN: r0=511(x1), r1=56(y1), r2=80(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 56
LDI r2, 80
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
