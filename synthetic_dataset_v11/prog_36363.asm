; DESCRIPTION: Composite: . Then Draws a red line from (232, 63) to (45, 222). Then Places a blue dot at position (38, 147).
; PLAN: r0=232(x1), r1=63(y1), r2=45(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=38(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (232, 63) to (45, 222).
; PLAN: r0=232(x1), r1=63(y1), r2=45(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 63
LDI r2, 45
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (38, 147).
; PLAN: r0=38(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
