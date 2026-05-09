; DESCRIPTION: Draws a magenta line from (14, 242) to (509, 123).
; PLAN: r0=14(x1), r1=242(y1), r2=509(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 242
LDI r2, 509
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
