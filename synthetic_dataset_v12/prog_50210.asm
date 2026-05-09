; DESCRIPTION: Draws a green line from (332, 157) to (229, 70).
; PLAN: r0=332(x1), r1=157(y1), r2=229(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 157
LDI r2, 229
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
