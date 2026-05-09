; DESCRIPTION: Composite: . Then Creates a white circular shape at (104, 165) with radius 69. Then Draws a orange line from (49, 42) to (72, 232).
; PLAN: r0=104(x), r1=165(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x1), r1=42(y1), r2=72(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (104, 165) with radius 69.
; PLAN: r0=104(x), r1=165(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 165
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (49, 42) to (72, 232).
; PLAN: r0=49(x1), r1=42(y1), r2=72(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 42
LDI r2, 72
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
