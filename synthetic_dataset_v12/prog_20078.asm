; DESCRIPTION: Places a blue 69x72 rectangle at position (341, 34).
; PLAN: r0=341(x), r1=34(y), r2=69(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 34
LDI r2, 69
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
