; DESCRIPTION: Renders a orange line between points (248, 244) and (380, 60).
; PLAN: r0=248(x1), r1=244(y1), r2=380(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 244
LDI r2, 380
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
