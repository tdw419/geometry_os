; DESCRIPTION: Composite: . Then Draws a orange circle centered at (129, 140) with radius 60. Then Draws a red line from (254, 95) to (196, 112).
; PLAN: r0=129(x), r1=140(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x1), r1=95(y1), r2=196(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (129, 140) with radius 60.
; PLAN: r0=129(x), r1=140(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 140
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (254, 95) to (196, 112).
; PLAN: r0=254(x1), r1=95(y1), r2=196(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 95
LDI r2, 196
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
