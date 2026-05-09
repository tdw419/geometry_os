; DESCRIPTION: Composite: . Then Places a black dot at position (160, 123). Then Draws a yellow line from (194, 253) to (219, 176).
; PLAN: r0=160(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=194(x1), r1=253(y1), r2=219(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (160, 123).
; PLAN: r0=160(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 123
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (194, 253) to (219, 176).
; PLAN: r0=194(x1), r1=253(y1), r2=219(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 253
LDI r2, 219
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
