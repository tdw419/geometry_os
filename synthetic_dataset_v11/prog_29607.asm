; DESCRIPTION: Composite: . Then Places a white line segment connecting (229, 40) to (184, 31). Then Draws a white circle centered at (55, 157) with radius 45.
; PLAN: r0=229(x1), r1=40(y1), r2=184(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=55(x), r1=157(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (229, 40) to (184, 31).
; PLAN: r0=229(x1), r1=40(y1), r2=184(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 40
LDI r2, 184
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (55, 157) with radius 45.
; PLAN: r0=55(x), r1=157(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 157
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
