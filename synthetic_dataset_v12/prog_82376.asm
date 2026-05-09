; DESCRIPTION: Places a blue 12x37 rectangle at position (113, 136).
; PLAN: r0=113(x), r1=136(y), r2=12(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 136
LDI r2, 12
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
