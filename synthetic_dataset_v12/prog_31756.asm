; DESCRIPTION: Places a blue 101x69 rectangle at position (403, 125).
; PLAN: r0=403(x), r1=125(y), r2=101(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 125
LDI r2, 101
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
