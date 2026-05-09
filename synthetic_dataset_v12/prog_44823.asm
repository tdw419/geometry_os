; DESCRIPTION: Places a blue 26x17 rectangle at position (267, 53).
; PLAN: r0=267(x), r1=53(y), r2=26(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 53
LDI r2, 26
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
