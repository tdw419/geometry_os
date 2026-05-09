; DESCRIPTION: Draws a orange line from (384, 189) to (198, 28).
; PLAN: r0=384(x1), r1=189(y1), r2=198(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 189
LDI r2, 198
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
