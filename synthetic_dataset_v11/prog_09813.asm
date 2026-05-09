; DESCRIPTION: Draws a magenta line from (137, 173) to (85, 113).
; PLAN: r0=137(x1), r1=173(y1), r2=85(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 173
LDI r2, 85
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
