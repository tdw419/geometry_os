; DESCRIPTION: Draws a magenta line from (173, 58) to (138, 189).
; PLAN: r0=173(x1), r1=58(y1), r2=138(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 58
LDI r2, 138
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
