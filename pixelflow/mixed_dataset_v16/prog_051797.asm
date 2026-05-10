; DESCRIPTION: Draws a green line from (353, 23) to (347, 21).
; PLAN: r0=353(x1), r1=23(y1), r2=347(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 23
LDI r2, 347
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
