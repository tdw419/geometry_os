; DESCRIPTION: Draws a red line from (377, 116) to (485, 242).
; PLAN: r0=377(x1), r1=116(y1), r2=485(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 116
LDI r2, 485
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
