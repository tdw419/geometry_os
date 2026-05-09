; DESCRIPTION: Draws a red line from (138, 9) to (72, 64).
; PLAN: r0=138(x1), r1=9(y1), r2=72(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 9
LDI r2, 72
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
