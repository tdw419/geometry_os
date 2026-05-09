; DESCRIPTION: Composite: . Then Draws a orange circle centered at (168, 128) with radius 73. Then Places a black line segment connecting (33, 138) to (200, 46).
; PLAN: r0=168(x), r1=128(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x1), r1=138(y1), r2=200(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (168, 128) with radius 73.
; PLAN: r0=168(x), r1=128(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 128
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (33, 138) to (200, 46).
; PLAN: r0=33(x1), r1=138(y1), r2=200(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 138
LDI r2, 200
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
