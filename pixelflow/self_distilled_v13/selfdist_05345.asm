; DESCRIPTION: Draws a yellow line from (146, 9) to (31, 190).
; PLAN: r0=146(x1), r1=9(y1), r2=31(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 9
LDI r2, 31
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
