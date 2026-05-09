; DESCRIPTION: Draws a blue line from (151, 221) to (272, 188).
; PLAN: r0=151(x1), r1=221(y1), r2=272(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 221
LDI r2, 272
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
