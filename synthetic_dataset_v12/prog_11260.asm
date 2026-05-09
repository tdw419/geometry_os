; DESCRIPTION: Places a blue 43x34 rectangle at position (375, 93).
; PLAN: r0=375(x), r1=93(y), r2=43(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 93
LDI r2, 43
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
