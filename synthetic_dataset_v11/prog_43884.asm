; DESCRIPTION: Composite: . Then Places a cyan dot at position (87, 43). Then Renders a green line between points (232, 111) and (179, 217).
; PLAN: r0=87(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=232(x1), r1=111(y1), r2=179(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (87, 43).
; PLAN: r0=87(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (232, 111) and (179, 217).
; PLAN: r0=232(x1), r1=111(y1), r2=179(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 111
LDI r2, 179
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
