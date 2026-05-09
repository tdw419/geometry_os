; DESCRIPTION: Composite: . Then Places a red 105x90 rectangle at position (130, 155). Then Creates a white circular shape at (87, 14) with radius 14.
; PLAN: r0=130(x), r1=155(y), r2=105(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x), r1=14(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 105x90 rectangle at position (130, 155).
; PLAN: r0=130(x), r1=155(y), r2=105(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 155
LDI r2, 105
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (87, 14) with radius 14.
; PLAN: r0=87(x), r1=14(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 14
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
