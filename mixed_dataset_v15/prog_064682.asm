; DESCRIPTION: Draws a magenta line from (82, 103) to (506, 199).
; PLAN: r0=82(x1), r1=103(y1), r2=506(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 103
LDI r2, 506
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
