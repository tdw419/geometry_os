; DESCRIPTION: Composite: . Then Draws a black circle centered at (147, 207) with radius 27. Then Draws a black line from (244, 252) to (15, 135).
; PLAN: r0=147(x), r1=207(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=244(x1), r1=252(y1), r2=15(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (147, 207) with radius 27.
; PLAN: r0=147(x), r1=207(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 207
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (244, 252) to (15, 135).
; PLAN: r0=244(x1), r1=252(y1), r2=15(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 252
LDI r2, 15
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
