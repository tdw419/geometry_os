; DESCRIPTION: Draws a magenta line from (214, 94) to (234, 237).
; PLAN: r0=214(x1), r1=94(y1), r2=234(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 94
LDI r2, 234
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
