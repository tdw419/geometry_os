; DESCRIPTION: Composite: . Then Places a black dot at position (212, 93). Then Draws a cyan line from (125, 134) to (98, 222).
; PLAN: r0=212(x), r1=93(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=125(x1), r1=134(y1), r2=98(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (212, 93).
; PLAN: r0=212(x), r1=93(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 93
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (125, 134) to (98, 222).
; PLAN: r0=125(x1), r1=134(y1), r2=98(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 134
LDI r2, 98
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
