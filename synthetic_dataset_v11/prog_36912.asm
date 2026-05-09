; DESCRIPTION: Composite: . Then Places a orange 105x109 rectangle at position (117, 113). Then Creates a black circular shape at (163, 93) with radius 34.
; PLAN: r0=117(x), r1=113(y), r2=105(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=163(x), r1=93(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 105x109 rectangle at position (117, 113).
; PLAN: r0=117(x), r1=113(y), r2=105(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 113
LDI r2, 105
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (163, 93) with radius 34.
; PLAN: r0=163(x), r1=93(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 93
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
