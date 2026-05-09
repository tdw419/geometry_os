; DESCRIPTION: Draws a magenta line from (103, 151) to (107, 122).
; PLAN: r0=103(x1), r1=151(y1), r2=107(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 151
LDI r2, 107
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
