; DESCRIPTION: Draws a magenta line from (55, 173) to (113, 48).
; PLAN: r0=55(x1), r1=173(y1), r2=113(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 173
LDI r2, 113
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
