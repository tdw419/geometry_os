; DESCRIPTION: Composite: . Then Draws a red rectangle at (151, 104) with width 36 and height 49. Then Places a purple circle of radius 10 at center (218, 79).
; PLAN: r0=151(x), r1=104(y), r2=36(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=218(x), r1=79(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red rectangle at (151, 104) with width 36 and height 49.
; PLAN: r0=151(x), r1=104(y), r2=36(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 104
LDI r2, 36
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 10 at center (218, 79).
; PLAN: r0=218(x), r1=79(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 79
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
