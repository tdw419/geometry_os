; DESCRIPTION: Draws a blue rectangle at (32, 42) with width 53 and height 70.
; PLAN: r0=32(x), r1=42(y), r2=53(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 42
LDI r2, 53
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
