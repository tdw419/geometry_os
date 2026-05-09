; DESCRIPTION: Draws a magenta line from (218, 86) to (49, 168).
; PLAN: r0=218(x1), r1=86(y1), r2=49(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 86
LDI r2, 49
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
