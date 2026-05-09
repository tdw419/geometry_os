; DESCRIPTION: Draws a magenta line from (228, 178) to (496, 126).
; PLAN: r0=228(x1), r1=178(y1), r2=496(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 178
LDI r2, 496
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
