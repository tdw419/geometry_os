; DESCRIPTION: Draws a magenta line from (327, 96) to (132, 192).
; PLAN: r0=327(x1), r1=96(y1), r2=132(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 96
LDI r2, 132
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
