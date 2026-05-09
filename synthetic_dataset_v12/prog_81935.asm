; DESCRIPTION: Composite: Places a purple 35x110 rectangle at position (298, 108) then Creates a orange circular shape at (133, 79) with radius 24.
; PLAN: r0=298(x), r1=108(y), r2=35(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=79(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 108
LDI r2, 35
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 79
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
