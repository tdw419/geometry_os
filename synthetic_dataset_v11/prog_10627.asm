; DESCRIPTION: Composite: . Then Draws a orange line from (137, 138) to (148, 27). Then Sets a single green pixel at (3, 165).
; PLAN: r0=137(x1), r1=138(y1), r2=148(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=3(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (137, 138) to (148, 27).
; PLAN: r0=137(x1), r1=138(y1), r2=148(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 138
LDI r2, 148
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (3, 165).
; PLAN: r0=3(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 165
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
