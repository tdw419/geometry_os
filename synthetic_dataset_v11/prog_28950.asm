; DESCRIPTION: Composite: . Then Sets a single white pixel at (27, 144). Then Places a orange line segment connecting (82, 237) to (241, 222).
; PLAN: r0=27(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=82(x1), r1=237(y1), r2=241(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (27, 144).
; PLAN: r0=27(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (82, 237) to (241, 222).
; PLAN: r0=82(x1), r1=237(y1), r2=241(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 237
LDI r2, 241
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
