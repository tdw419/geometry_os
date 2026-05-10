; DESCRIPTION: Composite: Places a purple line segment connecting (429, 228) to (412, 166) then Places a purple dot at position (409, 3) then Places a white circle of radius 15 at center (431, 156).
; PLAN: r0=429(x1), r1=228(y1), r2=412(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=3(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=156(y), r12=15(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 228
LDI r2, 412
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 3
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 156
LDI r12, 15
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
