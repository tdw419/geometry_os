; DESCRIPTION: Composite: . Then Places a orange dot at position (111, 120). Then Places a magenta line segment connecting (43, 46) to (125, 166).
; PLAN: r0=111(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=43(x1), r1=46(y1), r2=125(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (111, 120).
; PLAN: r0=111(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (43, 46) to (125, 166).
; PLAN: r0=43(x1), r1=46(y1), r2=125(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 46
LDI r2, 125
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
