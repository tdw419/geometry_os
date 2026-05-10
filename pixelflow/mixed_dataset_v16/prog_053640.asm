; DESCRIPTION: Draws a blue line from (109, 36) to (401, 160).
; PLAN: r0=109(x1), r1=36(y1), r2=401(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 36
LDI r2, 401
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
