; DESCRIPTION: Draws a magenta line from (263, 151) to (164, 96).
; PLAN: r0=263(x1), r1=151(y1), r2=164(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 151
LDI r2, 164
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
