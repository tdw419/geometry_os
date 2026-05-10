; DESCRIPTION: Draws a magenta line from (111, 249) to (453, 164).
; PLAN: r0=111(x1), r1=249(y1), r2=453(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 249
LDI r2, 453
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
