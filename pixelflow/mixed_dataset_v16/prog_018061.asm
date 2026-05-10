; DESCRIPTION: Draws a orange line from (67, 238) to (28, 128).
; PLAN: r0=67(x1), r1=238(y1), r2=28(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 238
LDI r2, 28
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
