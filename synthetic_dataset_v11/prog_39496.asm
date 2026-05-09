; DESCRIPTION: Draws a red line from (138, 72) to (126, 99).
; PLAN: r0=138(x1), r1=72(y1), r2=126(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 72
LDI r2, 126
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
