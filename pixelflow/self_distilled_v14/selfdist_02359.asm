; DESCRIPTION: Draws a white line from (46, 160) to (28, 11).
; PLAN: r0=46(x1), r1=160(y1), r2=28(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 160
LDI r2, 28
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
