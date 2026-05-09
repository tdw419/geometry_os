; DESCRIPTION: Composite: . Then Renders a cyan line between points (170, 238) and (152, 93). Then Places a orange dot at position (175, 2).
; PLAN: r0=170(x1), r1=238(y1), r2=152(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=175(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (170, 238) and (152, 93).
; PLAN: r0=170(x1), r1=238(y1), r2=152(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 238
LDI r2, 152
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (175, 2).
; PLAN: r0=175(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 2
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
