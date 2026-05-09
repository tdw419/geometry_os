; DESCRIPTION: Composite: . Then Places a magenta dot at position (106, 123). Then Draws a white line from (81, 191) to (165, 18).
; PLAN: r0=106(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=81(x1), r1=191(y1), r2=165(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (106, 123).
; PLAN: r0=106(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 123
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (81, 191) to (165, 18).
; PLAN: r0=81(x1), r1=191(y1), r2=165(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 191
LDI r2, 165
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
