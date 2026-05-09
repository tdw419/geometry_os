; DESCRIPTION: Draws a red line from (449, 114) to (253, 152).
; PLAN: r0=449(x1), r1=114(y1), r2=253(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 114
LDI r2, 253
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
