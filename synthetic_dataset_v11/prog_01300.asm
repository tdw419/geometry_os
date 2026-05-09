; DESCRIPTION: Composite: . Then Draws a magenta line from (116, 63) to (23, 10). Then Places a blue dot at position (162, 195).
; PLAN: r0=116(x1), r1=63(y1), r2=23(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (116, 63) to (23, 10).
; PLAN: r0=116(x1), r1=63(y1), r2=23(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 63
LDI r2, 23
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (162, 195).
; PLAN: r0=162(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 195
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
