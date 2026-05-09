; DESCRIPTION: Composite: . Then Places a red dot at position (94, 125). Then Renders a blue line between points (200, 164) and (161, 215).
; PLAN: r0=94(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=200(x1), r1=164(y1), r2=161(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (94, 125).
; PLAN: r0=94(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 125
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (200, 164) and (161, 215).
; PLAN: r0=200(x1), r1=164(y1), r2=161(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 164
LDI r2, 161
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
