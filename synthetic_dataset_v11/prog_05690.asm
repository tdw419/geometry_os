; DESCRIPTION: Composite: . Then Renders a blue line between points (208, 237) and (136, 204). Then Places a cyan dot at position (85, 179).
; PLAN: r0=208(x1), r1=237(y1), r2=136(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=85(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (208, 237) and (136, 204).
; PLAN: r0=208(x1), r1=237(y1), r2=136(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 237
LDI r2, 136
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (85, 179).
; PLAN: r0=85(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
