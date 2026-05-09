; DESCRIPTION: Composite: Places a orange line segment connecting (8, 50) to (93, 1) then Renders a purple box of size 117x101 starting at (382, 53) then Sets a single white pixel at (487, 169).
; PLAN: r0=8(x1), r1=50(y1), r2=93(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=53(y), r7=117(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=487(x), r11=169(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 8
LDI r1, 50
LDI r2, 93
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 53
LDI r7, 117
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 169
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
