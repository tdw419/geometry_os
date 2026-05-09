; DESCRIPTION: Composite: . Then Places a orange dot at position (106, 163). Then Draws a white line from (3, 38) to (182, 125).
; PLAN: r0=106(x), r1=163(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=3(x1), r1=38(y1), r2=182(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (106, 163).
; PLAN: r0=106(x), r1=163(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 163
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (3, 38) to (182, 125).
; PLAN: r0=3(x1), r1=38(y1), r2=182(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 38
LDI r2, 182
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
