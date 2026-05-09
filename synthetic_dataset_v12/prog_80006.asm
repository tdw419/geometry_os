; DESCRIPTION: Draws a red line from (264, 177) to (196, 126).
; PLAN: r0=264(x1), r1=177(y1), r2=196(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 177
LDI r2, 196
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
