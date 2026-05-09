; DESCRIPTION: Composite: . Then Draws a white rectangle at (160, 118) with width 64 and height 91. Then Places a black circle of radius 60 at center (160, 74).
; PLAN: r0=160(x), r1=118(y), r2=64(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=160(x), r1=74(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (160, 118) with width 64 and height 91.
; PLAN: r0=160(x), r1=118(y), r2=64(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 118
LDI r2, 64
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 60 at center (160, 74).
; PLAN: r0=160(x), r1=74(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 74
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
