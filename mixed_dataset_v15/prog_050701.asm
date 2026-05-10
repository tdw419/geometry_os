; DESCRIPTION: Places a blue 17x69 rectangle at position (180, 135).
; PLAN: r0=180(x), r1=135(y), r2=17(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 135
LDI r2, 17
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
