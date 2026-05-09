; DESCRIPTION: Draws a green line from (272, 1) to (374, 11).
; PLAN: r0=272(x1), r1=1(y1), r2=374(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 1
LDI r2, 374
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
