; DESCRIPTION: Renders a orange line between points (294, 17) and (95, 128).
; PLAN: r0=294(x1), r1=17(y1), r2=95(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 17
LDI r2, 95
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
