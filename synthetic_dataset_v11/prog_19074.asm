; DESCRIPTION: Composite: . Then Draws a green line from (172, 31) to (160, 9). Then Places a black circle of radius 33 at center (102, 134).
; PLAN: r0=172(x1), r1=31(y1), r2=160(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=134(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (172, 31) to (160, 9).
; PLAN: r0=172(x1), r1=31(y1), r2=160(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 31
LDI r2, 160
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 33 at center (102, 134).
; PLAN: r0=102(x), r1=134(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 134
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
