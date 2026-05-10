; DESCRIPTION: Draws a orange line from (63, 54) to (256, 120).
; PLAN: r0=63(x1), r1=54(y1), r2=256(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 54
LDI r2, 256
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
