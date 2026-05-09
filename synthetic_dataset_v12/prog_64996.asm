; DESCRIPTION: Draws a orange line from (305, 11) to (395, 171).
; PLAN: r0=305(x1), r1=11(y1), r2=395(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 11
LDI r2, 395
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
