; DESCRIPTION: Draws a magenta line from (141, 164) to (292, 113).
; PLAN: r0=141(x1), r1=164(y1), r2=292(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 164
LDI r2, 292
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
