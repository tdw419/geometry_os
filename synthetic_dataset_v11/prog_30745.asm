; DESCRIPTION: Draws a orange line from (72, 126) to (90, 5).
; PLAN: r0=72(x1), r1=126(y1), r2=90(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 126
LDI r2, 90
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
