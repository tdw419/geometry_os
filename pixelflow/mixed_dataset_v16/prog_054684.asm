; DESCRIPTION: Composite: Places a purple 87x29 rectangle at position (37, 47) then Draws a purple circle centered at (234, 100) with radius 46.
; PLAN: r0=37(x), r1=47(y), r2=87(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=100(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 47
LDI r2, 87
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 100
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
