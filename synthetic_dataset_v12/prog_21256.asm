; DESCRIPTION: Places a blue 67x52 rectangle at position (265, 148).
; PLAN: r0=265(x), r1=148(y), r2=67(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 148
LDI r2, 67
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
