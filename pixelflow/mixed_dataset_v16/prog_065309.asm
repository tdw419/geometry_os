; DESCRIPTION: Places a blue 29x29 rectangle at position (72, 32).
; PLAN: r0=72(x), r1=32(y), r2=29(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 32
LDI r2, 29
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
