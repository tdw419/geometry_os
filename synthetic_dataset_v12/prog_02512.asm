; DESCRIPTION: Draws a yellow line from (26, 146) to (467, 7).
; PLAN: r0=26(x1), r1=146(y1), r2=467(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 146
LDI r2, 467
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
