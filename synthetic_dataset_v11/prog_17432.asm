; DESCRIPTION: Composite: . Then Places a orange dot at position (118, 239). Then Places a yellow line segment connecting (34, 27) to (228, 88).
; PLAN: r0=118(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=34(x1), r1=27(y1), r2=228(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (118, 239).
; PLAN: r0=118(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (34, 27) to (228, 88).
; PLAN: r0=34(x1), r1=27(y1), r2=228(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 27
LDI r2, 228
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
