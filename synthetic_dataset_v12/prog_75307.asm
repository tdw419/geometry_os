; DESCRIPTION: Places a blue 69x47 rectangle at position (321, 53).
; PLAN: r0=321(x), r1=53(y), r2=69(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 53
LDI r2, 69
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
