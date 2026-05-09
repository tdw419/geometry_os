; DESCRIPTION: Composite: . Then Places a orange circle of radius 56 at center (96, 104). Then Places a blue 15x87 rectangle at position (58, 0).
; PLAN: r0=96(x), r1=104(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=58(x), r1=0(y), r2=15(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 56 at center (96, 104).
; PLAN: r0=96(x), r1=104(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 104
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 15x87 rectangle at position (58, 0).
; PLAN: r0=58(x), r1=0(y), r2=15(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 0
LDI r2, 15
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
