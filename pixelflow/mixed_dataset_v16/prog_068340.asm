; DESCRIPTION: Draws a red line from (4, 138) to (485, 58).
; PLAN: r0=4(x1), r1=138(y1), r2=485(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 138
LDI r2, 485
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
