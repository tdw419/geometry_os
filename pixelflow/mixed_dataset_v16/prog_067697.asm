; DESCRIPTION: Places a blue 29x61 rectangle at position (144, 63).
; PLAN: r0=144(x), r1=63(y), r2=29(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 63
LDI r2, 29
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
