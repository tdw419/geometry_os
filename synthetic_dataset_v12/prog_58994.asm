; DESCRIPTION: Draws a magenta line from (81, 139) to (401, 118).
; PLAN: r0=81(x1), r1=139(y1), r2=401(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 139
LDI r2, 401
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
