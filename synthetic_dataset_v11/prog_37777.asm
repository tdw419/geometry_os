; DESCRIPTION: Composite: . Then Renders a cyan line between points (211, 5) and (249, 205). Then Sets a single red pixel at (196, 100).
; PLAN: r0=211(x1), r1=5(y1), r2=249(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=196(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (211, 5) and (249, 205).
; PLAN: r0=211(x1), r1=5(y1), r2=249(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 5
LDI r2, 249
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (196, 100).
; PLAN: r0=196(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
