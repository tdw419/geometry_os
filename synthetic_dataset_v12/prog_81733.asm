; DESCRIPTION: Places a blue 22x113 rectangle at position (105, 136).
; PLAN: r0=105(x), r1=136(y), r2=22(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 136
LDI r2, 22
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
