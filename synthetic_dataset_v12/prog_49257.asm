; DESCRIPTION: Composite: Renders a yellow box of size 111x29 starting at (270, 53) then Places a yellow dot at position (100, 87) then Places a purple line segment connecting (168, 75) to (495, 117).
; PLAN: r0=270(x), r1=53(y), r2=111(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=87(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=75(y1), r12=495(x2), r13=117(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 53
LDI r2, 111
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 87
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 168
LDI r11, 75
LDI r12, 495
LDI r13, 117
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
