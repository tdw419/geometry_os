; DESCRIPTION: Composite: . Then Sets a single orange pixel at (172, 210). Then Draws a magenta line from (70, 232) to (45, 219).
; PLAN: r0=172(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=70(x1), r1=232(y1), r2=45(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (172, 210).
; PLAN: r0=172(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 210
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (70, 232) to (45, 219).
; PLAN: r0=70(x1), r1=232(y1), r2=45(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 232
LDI r2, 45
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
