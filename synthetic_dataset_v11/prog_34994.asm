; DESCRIPTION: Draws a red line from (166, 48) to (226, 56).
; PLAN: r0=166(x1), r1=48(y1), r2=226(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 48
LDI r2, 226
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
