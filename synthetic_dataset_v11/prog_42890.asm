; DESCRIPTION: Composite: . Then Places a orange dot at position (234, 55). Then Draws a yellow line from (159, 91) to (225, 31).
; PLAN: r0=234(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=159(x1), r1=91(y1), r2=225(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (234, 55).
; PLAN: r0=234(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 55
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (159, 91) to (225, 31).
; PLAN: r0=159(x1), r1=91(y1), r2=225(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 91
LDI r2, 225
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
