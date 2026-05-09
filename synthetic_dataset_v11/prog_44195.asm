; DESCRIPTION: Draws a yellow line from (252, 57) to (190, 177).
; PLAN: r0=252(x1), r1=57(y1), r2=190(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 57
LDI r2, 190
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
