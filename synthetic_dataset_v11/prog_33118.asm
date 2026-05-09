; DESCRIPTION: Composite: . Then Draws a black circle centered at (124, 189) with radius 62. Then Draws a white line from (254, 229) to (5, 109).
; PLAN: r0=124(x), r1=189(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x1), r1=229(y1), r2=5(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (124, 189) with radius 62.
; PLAN: r0=124(x), r1=189(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 189
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (254, 229) to (5, 109).
; PLAN: r0=254(x1), r1=229(y1), r2=5(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 229
LDI r2, 5
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
