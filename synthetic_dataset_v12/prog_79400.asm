; DESCRIPTION: Draws a orange line from (503, 8) to (294, 230).
; PLAN: r0=503(x1), r1=8(y1), r2=294(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 8
LDI r2, 294
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
