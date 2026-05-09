; DESCRIPTION: Composite: . Then Draws a white rectangle at (106, 72) with width 65 and height 81. Then Places a black circle of radius 56 at center (175, 87).
; PLAN: r0=106(x), r1=72(y), r2=65(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=87(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (106, 72) with width 65 and height 81.
; PLAN: r0=106(x), r1=72(y), r2=65(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 72
LDI r2, 65
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 56 at center (175, 87).
; PLAN: r0=175(x), r1=87(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 87
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
