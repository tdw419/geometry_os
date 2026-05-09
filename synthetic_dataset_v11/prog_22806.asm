; DESCRIPTION: Composite: . Then Places a white line segment connecting (32, 113) to (6, 99). Then Draws a black circle centered at (127, 187) with radius 24.
; PLAN: r0=32(x1), r1=113(y1), r2=6(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=127(x), r1=187(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (32, 113) to (6, 99).
; PLAN: r0=32(x1), r1=113(y1), r2=6(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 113
LDI r2, 6
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (127, 187) with radius 24.
; PLAN: r0=127(x), r1=187(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 187
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
