; DESCRIPTION: Composite: . Then Places a black line segment connecting (31, 143) to (9, 221). Then Draws a white circle centered at (187, 123) with radius 64.
; PLAN: r0=31(x1), r1=143(y1), r2=9(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=187(x), r1=123(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (31, 143) to (9, 221).
; PLAN: r0=31(x1), r1=143(y1), r2=9(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 143
LDI r2, 9
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (187, 123) with radius 64.
; PLAN: r0=187(x), r1=123(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 123
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
