; DESCRIPTION: Draws a magenta line from (218, 12) to (14, 131).
; PLAN: r0=218(x1), r1=12(y1), r2=14(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 12
LDI r2, 14
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
