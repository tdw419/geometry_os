; DESCRIPTION: Composite: . Then Creates a orange circular shape at (99, 89) with radius 75. Then Draws a magenta line from (61, 173) to (33, 203).
; PLAN: r0=99(x), r1=89(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=61(x1), r1=173(y1), r2=33(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (99, 89) with radius 75.
; PLAN: r0=99(x), r1=89(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 89
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (61, 173) to (33, 203).
; PLAN: r0=61(x1), r1=173(y1), r2=33(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 173
LDI r2, 33
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
