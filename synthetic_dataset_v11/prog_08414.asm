; DESCRIPTION: Composite: . Then Places a green dot at position (213, 35). Then Renders a cyan line between points (75, 201) and (184, 181).
; PLAN: r0=213(x), r1=35(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=75(x1), r1=201(y1), r2=184(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (213, 35).
; PLAN: r0=213(x), r1=35(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 35
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (75, 201) and (184, 181).
; PLAN: r0=75(x1), r1=201(y1), r2=184(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 201
LDI r2, 184
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
