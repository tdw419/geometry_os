; DESCRIPTION: Draws a green line from (17, 15) to (193, 26).
; PLAN: r0=17(x1), r1=15(y1), r2=193(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 15
LDI r2, 193
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
