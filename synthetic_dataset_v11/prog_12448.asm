; DESCRIPTION: Places a blue 75x53 rectangle at position (138, 135).
; PLAN: r0=138(x), r1=135(y), r2=75(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 135
LDI r2, 75
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
