; DESCRIPTION: Composite: . Then Places a yellow dot at position (171, 216). Then Draws a blue line from (180, 158) to (4, 98).
; PLAN: r0=171(x), r1=216(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=180(x1), r1=158(y1), r2=4(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (171, 216).
; PLAN: r0=171(x), r1=216(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 216
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (180, 158) to (4, 98).
; PLAN: r0=180(x1), r1=158(y1), r2=4(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 158
LDI r2, 4
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
