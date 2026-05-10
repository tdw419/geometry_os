; DESCRIPTION: Places a blue 64x58 rectangle at position (235, 101).
; PLAN: r0=235(x), r1=101(y), r2=64(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 101
LDI r2, 64
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
