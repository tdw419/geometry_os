; DESCRIPTION: Composite: Places a purple 113x79 rectangle at position (54, 91) then Creates a purple circular shape at (293, 200) with radius 37.
; PLAN: r0=54(x), r1=91(y), r2=113(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=200(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 91
LDI r2, 113
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 200
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
