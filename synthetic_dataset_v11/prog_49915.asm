; DESCRIPTION: Draws a magenta line from (214, 31) to (2, 86).
; PLAN: r0=214(x1), r1=31(y1), r2=2(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 31
LDI r2, 2
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
