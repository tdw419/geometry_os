; DESCRIPTION: Composite: . Then Draws a orange line from (234, 93) to (52, 114). Then Creates a orange circular shape at (171, 242) with radius 13.
; PLAN: r0=234(x1), r1=93(y1), r2=52(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=171(x), r1=242(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (234, 93) to (52, 114).
; PLAN: r0=234(x1), r1=93(y1), r2=52(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 93
LDI r2, 52
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (171, 242) with radius 13.
; PLAN: r0=171(x), r1=242(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 242
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
