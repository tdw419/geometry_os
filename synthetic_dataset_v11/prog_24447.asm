; DESCRIPTION: Composite: . Then Draws a green line from (232, 91) to (40, 214). Then Sets a single orange pixel at (254, 249).
; PLAN: r0=232(x1), r1=91(y1), r2=40(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=254(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (232, 91) to (40, 214).
; PLAN: r0=232(x1), r1=91(y1), r2=40(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 91
LDI r2, 40
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (254, 249).
; PLAN: r0=254(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 249
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
