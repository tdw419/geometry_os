; DESCRIPTION: Draws a magenta line from (401, 245) to (311, 23).
; PLAN: r0=401(x1), r1=245(y1), r2=311(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 245
LDI r2, 311
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
