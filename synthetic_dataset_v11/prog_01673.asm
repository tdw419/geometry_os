; DESCRIPTION: Composite: . Then Renders a blue line between points (16, 160) and (125, 99). Then Sets a single cyan pixel at (180, 204).
; PLAN: r0=16(x1), r1=160(y1), r2=125(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=180(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (16, 160) and (125, 99).
; PLAN: r0=16(x1), r1=160(y1), r2=125(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 160
LDI r2, 125
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (180, 204).
; PLAN: r0=180(x), r1=204(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 204
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
