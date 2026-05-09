; DESCRIPTION: Composite: Draws a green line from (68, 114) to (291, 149) then Sets a single yellow pixel at (283, 100).
; PLAN: r0=68(x1), r1=114(y1), r2=291(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=100(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 68
LDI r1, 114
LDI r2, 291
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 100
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
