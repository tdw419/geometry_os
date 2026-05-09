; DESCRIPTION: Draws a yellow line from (169, 172) to (214, 164).
; PLAN: r0=169(x1), r1=172(y1), r2=214(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 172
LDI r2, 214
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
