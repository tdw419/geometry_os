; DESCRIPTION: Draws a black line from (275, 244) to (150, 67).
; PLAN: r0=275(x1), r1=244(y1), r2=150(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 244
LDI r2, 150
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
