; DESCRIPTION: Composite: . Then Places a black dot at position (215, 144). Then Places a orange line segment connecting (147, 206) to (209, 141).
; PLAN: r0=215(x), r1=144(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=147(x1), r1=206(y1), r2=209(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (215, 144).
; PLAN: r0=215(x), r1=144(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 144
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (147, 206) to (209, 141).
; PLAN: r0=147(x1), r1=206(y1), r2=209(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 206
LDI r2, 209
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
