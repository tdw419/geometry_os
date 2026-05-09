; DESCRIPTION: Draws a magenta line from (164, 113) to (144, 82).
; PLAN: r0=164(x1), r1=113(y1), r2=144(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 113
LDI r2, 144
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
