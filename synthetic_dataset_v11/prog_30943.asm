; DESCRIPTION: Places a blue 54x26 rectangle at position (103, 53).
; PLAN: r0=103(x), r1=53(y), r2=54(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 53
LDI r2, 54
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
