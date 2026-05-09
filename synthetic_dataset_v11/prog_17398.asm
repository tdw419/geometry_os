; DESCRIPTION: Composite: . Then Renders a black disk with center (209, 103) and radius 46. Then Places a red 75x24 rectangle at position (104, 52).
; PLAN: r0=209(x), r1=103(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=52(y), r2=75(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (209, 103) and radius 46.
; PLAN: r0=209(x), r1=103(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 103
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 75x24 rectangle at position (104, 52).
; PLAN: r0=104(x), r1=52(y), r2=75(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 52
LDI r2, 75
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
