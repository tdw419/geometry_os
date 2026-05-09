; DESCRIPTION: Draws a orange line from (9, 179) to (27, 243).
; PLAN: r0=9(x1), r1=179(y1), r2=27(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 179
LDI r2, 27
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
