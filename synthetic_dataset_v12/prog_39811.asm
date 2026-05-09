; DESCRIPTION: Draws a red line from (14, 196) to (90, 175).
; PLAN: r0=14(x1), r1=196(y1), r2=90(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 196
LDI r2, 90
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
