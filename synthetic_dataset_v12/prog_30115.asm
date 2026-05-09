; DESCRIPTION: Draws a magenta line from (342, 171) to (111, 50).
; PLAN: r0=342(x1), r1=171(y1), r2=111(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 171
LDI r2, 111
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
