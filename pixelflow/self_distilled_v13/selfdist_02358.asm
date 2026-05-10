; DESCRIPTION: Renders a orange line segment connecting (284, 62) to (365, 119).
; PLAN: r0=284(x1), r1=62(y1), r2=365(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 62
LDI r2, 365
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
