; DESCRIPTION: Draws a red line from (175, 248) to (69, 123).
; PLAN: r0=175(x1), r1=248(y1), r2=69(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 248
LDI r2, 69
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
