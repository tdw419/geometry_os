; DESCRIPTION: Draws a orange line from (103, 76) to (294, 175).
; PLAN: r0=103(x1), r1=76(y1), r2=294(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 76
LDI r2, 294
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
