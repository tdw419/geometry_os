; DESCRIPTION: Draws a orange line from (401, 214) to (147, 32).
; PLAN: r0=401(x1), r1=214(y1), r2=147(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 214
LDI r2, 147
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
