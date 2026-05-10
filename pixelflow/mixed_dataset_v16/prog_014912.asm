; DESCRIPTION: Draws a orange line from (215, 219) to (24, 37).
; PLAN: r0=215(x1), r1=219(y1), r2=24(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 219
LDI r2, 24
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
