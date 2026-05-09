; DESCRIPTION: Draws a yellow line from (11, 248) to (401, 205).
; PLAN: r0=11(x1), r1=248(y1), r2=401(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 248
LDI r2, 401
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
