; DESCRIPTION: Composite: . Then Places a white circle of radius 67 at center (100, 96). Then Renders a blue box of size 103x109 starting at (113, 86).
; PLAN: r0=100(x), r1=96(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=113(x), r1=86(y), r2=103(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 67 at center (100, 96).
; PLAN: r0=100(x), r1=96(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 96
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 103x109 starting at (113, 86).
; PLAN: r0=113(x), r1=86(y), r2=103(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 86
LDI r2, 103
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
