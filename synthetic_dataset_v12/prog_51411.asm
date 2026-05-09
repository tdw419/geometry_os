; DESCRIPTION: Composite: Renders a orange line between points (38, 10) and (13, 12) then Places a red dot at position (203, 218).
; PLAN: r0=38(x1), r1=10(y1), r2=13(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=218(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 10
LDI r2, 13
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 218
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
