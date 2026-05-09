; DESCRIPTION: Draws a white line from (214, 41) to (431, 65).
; PLAN: r0=214(x1), r1=41(y1), r2=431(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 41
LDI r2, 431
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
