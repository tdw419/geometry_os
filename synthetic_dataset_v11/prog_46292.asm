; DESCRIPTION: Composite: . Then Draws a cyan line from (254, 1) to (206, 195). Then Draws a black circle centered at (226, 227) with radius 23.
; PLAN: r0=254(x1), r1=1(y1), r2=206(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=226(x), r1=227(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (254, 1) to (206, 195).
; PLAN: r0=254(x1), r1=1(y1), r2=206(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 1
LDI r2, 206
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (226, 227) with radius 23.
; PLAN: r0=226(x), r1=227(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 227
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
