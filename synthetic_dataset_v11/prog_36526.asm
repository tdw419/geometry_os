; DESCRIPTION: Composite: . Then Draws a blue line from (252, 99) to (88, 250). Then Places a blue dot at position (33, 181).
; PLAN: r0=252(x1), r1=99(y1), r2=88(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=33(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (252, 99) to (88, 250).
; PLAN: r0=252(x1), r1=99(y1), r2=88(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 99
LDI r2, 88
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (33, 181).
; PLAN: r0=33(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
