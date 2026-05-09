; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (69, 89) with radius 56. Then Draws a orange line from (226, 131) to (252, 72).
; PLAN: r0=69(x), r1=89(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=226(x1), r1=131(y1), r2=252(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (69, 89) with radius 56.
; PLAN: r0=69(x), r1=89(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 89
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (226, 131) to (252, 72).
; PLAN: r0=226(x1), r1=131(y1), r2=252(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 131
LDI r2, 252
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
