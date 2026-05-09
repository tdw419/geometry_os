; DESCRIPTION: Places a blue 81x69 rectangle at position (16, 173).
; PLAN: r0=16(x), r1=173(y), r2=81(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 173
LDI r2, 81
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
