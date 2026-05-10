; DESCRIPTION: Renders a magenta line between points (436, 231) and (85, 113).
; PLAN: r0=436(x1), r1=231(y1), r2=85(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 231
LDI r2, 85
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
