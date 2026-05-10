; DESCRIPTION: Renders a orange line segment connecting (27, 160) to (294, 80).
; PLAN: r0=27(x1), r1=160(y1), r2=294(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 160
LDI r2, 294
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
