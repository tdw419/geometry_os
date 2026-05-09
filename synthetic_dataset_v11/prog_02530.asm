; DESCRIPTION: Composite: . Then Places a green dot at position (178, 129). Then Draws a blue line from (159, 229) to (206, 29).
; PLAN: r0=178(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=159(x1), r1=229(y1), r2=206(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (178, 129).
; PLAN: r0=178(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (159, 229) to (206, 29).
; PLAN: r0=159(x1), r1=229(y1), r2=206(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 229
LDI r2, 206
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
