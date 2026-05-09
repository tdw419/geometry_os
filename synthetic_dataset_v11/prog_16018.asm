; DESCRIPTION: Composite: . Then Places a black dot at position (58, 229). Then Places a magenta line segment connecting (77, 32) to (146, 155).
; PLAN: r0=58(x), r1=229(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=77(x1), r1=32(y1), r2=146(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (58, 229).
; PLAN: r0=58(x), r1=229(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 229
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (77, 32) to (146, 155).
; PLAN: r0=77(x1), r1=32(y1), r2=146(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 32
LDI r2, 146
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
