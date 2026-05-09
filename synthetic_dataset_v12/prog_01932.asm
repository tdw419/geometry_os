; DESCRIPTION: Draws a yellow line from (437, 178) to (123, 14).
; PLAN: r0=437(x1), r1=178(y1), r2=123(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 178
LDI r2, 123
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
