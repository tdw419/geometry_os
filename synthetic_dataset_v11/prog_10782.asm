; DESCRIPTION: Draws a red line from (243, 20) to (170, 144).
; PLAN: r0=243(x1), r1=20(y1), r2=170(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 20
LDI r2, 170
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
