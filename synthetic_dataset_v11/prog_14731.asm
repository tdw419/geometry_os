; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (207, 43) with radius 33. Then Places a green line segment connecting (85, 31) to (160, 106).
; PLAN: r0=207(x), r1=43(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=85(x1), r1=31(y1), r2=160(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (207, 43) with radius 33.
; PLAN: r0=207(x), r1=43(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 43
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (85, 31) to (160, 106).
; PLAN: r0=85(x1), r1=31(y1), r2=160(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 31
LDI r2, 160
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
