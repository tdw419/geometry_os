; DESCRIPTION: Composite: . Then Draws a red line from (99, 139) to (9, 208). Then Places a blue dot at position (76, 222).
; PLAN: r0=99(x1), r1=139(y1), r2=9(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=76(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (99, 139) to (9, 208).
; PLAN: r0=99(x1), r1=139(y1), r2=9(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 139
LDI r2, 9
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (76, 222).
; PLAN: r0=76(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
