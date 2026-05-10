; DESCRIPTION: Places a blue 75x18 rectangle at position (114, 163).
; PLAN: r0=114(x), r1=163(y), r2=75(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 163
LDI r2, 75
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
