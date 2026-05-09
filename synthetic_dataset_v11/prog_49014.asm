; DESCRIPTION: Composite: . Then Places a white 84x117 rectangle at position (104, 37). Then Creates a red circular shape at (188, 181) with radius 68.
; PLAN: r0=104(x), r1=37(y), r2=84(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=188(x), r1=181(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white 84x117 rectangle at position (104, 37).
; PLAN: r0=104(x), r1=37(y), r2=84(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 37
LDI r2, 84
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (188, 181) with radius 68.
; PLAN: r0=188(x), r1=181(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 181
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
