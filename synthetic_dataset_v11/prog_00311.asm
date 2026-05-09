; DESCRIPTION: Composite: . Then Places a cyan dot at position (210, 245). Then Renders a blue line between points (84, 159) and (145, 215).
; PLAN: r0=210(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=84(x1), r1=159(y1), r2=145(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (210, 245).
; PLAN: r0=210(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (84, 159) and (145, 215).
; PLAN: r0=84(x1), r1=159(y1), r2=145(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 159
LDI r2, 145
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
