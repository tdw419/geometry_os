; DESCRIPTION: Renders a blue box of size 114x60 starting at (284, 172).
; PLAN: r0=284(x), r1=172(y), r2=114(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 172
LDI r2, 114
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
