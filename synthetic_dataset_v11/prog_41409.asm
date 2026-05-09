; DESCRIPTION: Composite: . Then Places a orange dot at position (32, 206). Then Places a magenta line segment connecting (74, 104) to (179, 229).
; PLAN: r0=32(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=74(x1), r1=104(y1), r2=179(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (32, 206).
; PLAN: r0=32(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (74, 104) to (179, 229).
; PLAN: r0=74(x1), r1=104(y1), r2=179(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 104
LDI r2, 179
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
