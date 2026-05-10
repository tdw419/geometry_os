; DESCRIPTION: Composite: Renders a orange line between points (133, 23) and (422, 228) then Sets a single yellow pixel at (196, 224).
; PLAN: r0=133(x1), r1=23(y1), r2=422(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=224(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 133
LDI r1, 23
LDI r2, 422
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 224
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
