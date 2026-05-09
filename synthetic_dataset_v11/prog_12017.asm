; DESCRIPTION: Composite: . Then Draws a green line from (76, 241) to (88, 230). Then Places a blue dot at position (161, 168).
; PLAN: r0=76(x1), r1=241(y1), r2=88(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=168(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (76, 241) to (88, 230).
; PLAN: r0=76(x1), r1=241(y1), r2=88(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 241
LDI r2, 88
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (161, 168).
; PLAN: r0=161(x), r1=168(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 168
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
