; DESCRIPTION: Composite: . Then Places a blue dot at position (212, 147). Then Draws a orange line from (54, 161) to (183, 255).
; PLAN: r0=212(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=54(x1), r1=161(y1), r2=183(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (212, 147).
; PLAN: r0=212(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (54, 161) to (183, 255).
; PLAN: r0=54(x1), r1=161(y1), r2=183(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 161
LDI r2, 183
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
