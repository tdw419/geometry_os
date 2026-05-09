; DESCRIPTION: Renders a orange line between points (284, 106) and (248, 45).
; PLAN: r0=284(x1), r1=106(y1), r2=248(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 106
LDI r2, 248
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
