; DESCRIPTION: Draws a green line from (17, 222) to (212, 93).
; PLAN: r0=17(x1), r1=222(y1), r2=212(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 222
LDI r2, 212
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
