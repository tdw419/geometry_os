; DESCRIPTION: Draws a red line from (101, 254) to (7, 166).
; PLAN: r0=101(x1), r1=254(y1), r2=7(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 254
LDI r2, 7
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
