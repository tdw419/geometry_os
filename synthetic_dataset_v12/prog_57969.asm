; DESCRIPTION: Places a blue 69x66 rectangle at position (60, 135).
; PLAN: r0=60(x), r1=135(y), r2=69(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 135
LDI r2, 69
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
