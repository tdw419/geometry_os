; DESCRIPTION: Composite: . Then Draws a orange circle centered at (133, 95) with radius 55. Then Places a purple 115x56 rectangle at position (48, 145).
; PLAN: r0=133(x), r1=95(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=48(x), r1=145(y), r2=115(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (133, 95) with radius 55.
; PLAN: r0=133(x), r1=95(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 95
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 115x56 rectangle at position (48, 145).
; PLAN: r0=48(x), r1=145(y), r2=115(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 145
LDI r2, 115
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
