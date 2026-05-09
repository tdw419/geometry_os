; DESCRIPTION: Draws a red line from (401, 67) to (74, 147).
; PLAN: r0=401(x1), r1=67(y1), r2=74(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 67
LDI r2, 74
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
