; DESCRIPTION: Draws a magenta line from (407, 153) to (371, 146).
; PLAN: r0=407(x1), r1=153(y1), r2=371(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 153
LDI r2, 371
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
