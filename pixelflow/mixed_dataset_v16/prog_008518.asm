; DESCRIPTION: Places a blue 111x105 rectangle at position (78, 53).
; PLAN: r0=78(x), r1=53(y), r2=111(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 53
LDI r2, 111
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
