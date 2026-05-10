; DESCRIPTION: Draws a magenta line from (394, 136) to (284, 145).
; PLAN: r0=394(x1), r1=136(y1), r2=284(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 136
LDI r2, 284
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
