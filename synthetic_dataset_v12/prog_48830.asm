; DESCRIPTION: Draws a magenta line from (289, 106) to (263, 16).
; PLAN: r0=289(x1), r1=106(y1), r2=263(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 106
LDI r2, 263
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
