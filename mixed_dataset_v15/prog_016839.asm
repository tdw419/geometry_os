; DESCRIPTION: Draws a yellow line from (9, 177) to (187, 93).
; PLAN: r0=9(x1), r1=177(y1), r2=187(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 177
LDI r2, 187
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
