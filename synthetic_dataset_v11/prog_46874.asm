; DESCRIPTION: Draws a red line from (176, 210) to (5, 175).
; PLAN: r0=176(x1), r1=210(y1), r2=5(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 210
LDI r2, 5
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
