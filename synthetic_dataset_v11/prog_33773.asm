; DESCRIPTION: Composite: . Then Places a purple dot at position (241, 103). Then Draws a orange line from (49, 240) to (125, 108).
; PLAN: r0=241(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=49(x1), r1=240(y1), r2=125(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (241, 103).
; PLAN: r0=241(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (49, 240) to (125, 108).
; PLAN: r0=49(x1), r1=240(y1), r2=125(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 240
LDI r2, 125
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
