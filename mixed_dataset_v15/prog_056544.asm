; DESCRIPTION: Draws a red line from (20, 18) to (277, 29).
; PLAN: r0=20(x1), r1=18(y1), r2=277(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 18
LDI r2, 277
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
