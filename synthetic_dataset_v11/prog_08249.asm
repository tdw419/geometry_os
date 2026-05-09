; DESCRIPTION: Composite: . Then Places a black dot at position (140, 22). Then Draws a orange line from (40, 32) to (223, 118).
; PLAN: r0=140(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=40(x1), r1=32(y1), r2=223(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (140, 22).
; PLAN: r0=140(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (40, 32) to (223, 118).
; PLAN: r0=40(x1), r1=32(y1), r2=223(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 32
LDI r2, 223
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
