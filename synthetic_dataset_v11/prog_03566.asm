; DESCRIPTION: Composite: . Then Places a cyan dot at position (4, 216). Then Draws a black line from (241, 65) to (122, 100).
; PLAN: r0=4(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=241(x1), r1=65(y1), r2=122(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (4, 216).
; PLAN: r0=4(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 216
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (241, 65) to (122, 100).
; PLAN: r0=241(x1), r1=65(y1), r2=122(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 65
LDI r2, 122
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
