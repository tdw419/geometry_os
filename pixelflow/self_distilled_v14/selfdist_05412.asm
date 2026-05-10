; DESCRIPTION: Draws a magenta line from (282, 171) to (53, 69).
; PLAN: r0=282(x1), r1=171(y1), r2=53(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 171
LDI r2, 53
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
