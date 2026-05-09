; DESCRIPTION: Places a blue 60x29 rectangle at position (235, 8).
; PLAN: r0=235(x), r1=8(y), r2=60(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 8
LDI r2, 60
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
