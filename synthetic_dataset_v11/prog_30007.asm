; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (96, 215). Then Draws a yellow line from (9, 167) to (254, 68).
; PLAN: r0=96(x), r1=215(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=9(x1), r1=167(y1), r2=254(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (96, 215).
; PLAN: r0=96(x), r1=215(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 215
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (9, 167) to (254, 68).
; PLAN: r0=9(x1), r1=167(y1), r2=254(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 167
LDI r2, 254
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
