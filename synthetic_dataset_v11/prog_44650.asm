; DESCRIPTION: Composite: . Then Places a white dot at position (187, 52). Then Renders a cyan line between points (104, 75) and (90, 93).
; PLAN: r0=187(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=104(x1), r1=75(y1), r2=90(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (187, 52).
; PLAN: r0=187(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 52
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (104, 75) and (90, 93).
; PLAN: r0=104(x1), r1=75(y1), r2=90(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 75
LDI r2, 90
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
