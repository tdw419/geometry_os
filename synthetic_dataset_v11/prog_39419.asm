; DESCRIPTION: Composite: . Then Renders a magenta disk with center (208, 41) and radius 23. Then Places a purple 67x22 rectangle at position (15, 173).
; PLAN: r0=208(x), r1=41(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=15(x), r1=173(y), r2=67(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (208, 41) and radius 23.
; PLAN: r0=208(x), r1=41(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 41
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 67x22 rectangle at position (15, 173).
; PLAN: r0=15(x), r1=173(y), r2=67(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 173
LDI r2, 67
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
