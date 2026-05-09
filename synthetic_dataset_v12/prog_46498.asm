; DESCRIPTION: Composite: Places a orange dot at position (183, 199) then Places a blue line segment connecting (429, 123) to (148, 14).
; PLAN: r0=183(x), r1=199(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=123(y1), r7=148(x2), r8=14(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 199
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 429
LDI r6, 123
LDI r7, 148
LDI r8, 14
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
