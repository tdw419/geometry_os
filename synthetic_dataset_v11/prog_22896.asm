; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (241, 123) to (72, 209). Then Places a purple dot at position (50, 75).
; PLAN: r0=241(x1), r1=123(y1), r2=72(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (241, 123) to (72, 209).
; PLAN: r0=241(x1), r1=123(y1), r2=72(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 123
LDI r2, 72
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (50, 75).
; PLAN: r0=50(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
