; DESCRIPTION: Places a orange line segment connecting (387, 129) to (341, 93).
; PLAN: r0=387(x1), r1=129(y1), r2=341(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 129
LDI r2, 341
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
