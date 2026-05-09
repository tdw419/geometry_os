; DESCRIPTION: Places a blue 108x90 rectangle at position (400, 88).
; PLAN: r0=400(x), r1=88(y), r2=108(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 88
LDI r2, 108
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
