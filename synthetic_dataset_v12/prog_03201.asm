; DESCRIPTION: Draws a orange line from (341, 67) to (372, 164).
; PLAN: r0=341(x1), r1=67(y1), r2=372(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 67
LDI r2, 372
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
