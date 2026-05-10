; DESCRIPTION: Composite: Places a magenta line segment connecting (364, 70) to (181, 125) then Sets a single white pixel at (184, 76).
; PLAN: r0=364(x1), r1=70(y1), r2=181(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=76(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 70
LDI r2, 181
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 76
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
