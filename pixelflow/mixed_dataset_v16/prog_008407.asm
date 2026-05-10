; DESCRIPTION: Draws a orange line from (392, 7) to (345, 198).
; PLAN: r0=392(x1), r1=7(y1), r2=345(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 7
LDI r2, 345
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
