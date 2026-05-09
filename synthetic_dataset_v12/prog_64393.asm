; DESCRIPTION: Draws a magenta line from (12, 10) to (399, 103).
; PLAN: r0=12(x1), r1=10(y1), r2=399(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 10
LDI r2, 399
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
