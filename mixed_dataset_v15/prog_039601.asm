; DESCRIPTION: Draws a yellow line from (69, 3) to (178, 77).
; PLAN: r0=69(x1), r1=3(y1), r2=178(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 3
LDI r2, 178
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
