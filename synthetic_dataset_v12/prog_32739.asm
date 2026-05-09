; DESCRIPTION: Composite: Sets a single magenta pixel at (315, 184) then Places a purple 119x65 rectangle at position (337, 129) then Places a orange line segment connecting (254, 162) to (2, 143).
; PLAN: r0=315(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=129(y), r7=119(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=254(x1), r11=162(y1), r12=2(x2), r13=143(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 129
LDI r7, 119
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 162
LDI r12, 2
LDI r13, 143
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
