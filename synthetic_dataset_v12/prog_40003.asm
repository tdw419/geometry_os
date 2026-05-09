; DESCRIPTION: Draws a magenta line from (384, 133) to (265, 240).
; PLAN: r0=384(x1), r1=133(y1), r2=265(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 133
LDI r2, 265
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
