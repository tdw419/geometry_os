; DESCRIPTION: Composite: Draws a blue circle centered at (149, 93) with radius 48 then Places a purple 109x46 rectangle at position (152, 145).
; PLAN: r0=149(x), r1=93(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=145(y), r7=109(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 93
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 145
LDI r7, 109
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
