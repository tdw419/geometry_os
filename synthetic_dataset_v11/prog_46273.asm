; DESCRIPTION: Draws a yellow line from (6, 54) to (228, 190).
; PLAN: r0=6(x1), r1=54(y1), r2=228(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 54
LDI r2, 228
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
