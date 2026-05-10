; DESCRIPTION: Draws a magenta line from (130, 249) to (214, 175).
; PLAN: r0=130(x1), r1=249(y1), r2=214(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 249
LDI r2, 214
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
