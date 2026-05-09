; DESCRIPTION: Places a blue 26x43 rectangle at position (235, 204).
; PLAN: r0=235(x), r1=204(y), r2=26(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 204
LDI r2, 26
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
