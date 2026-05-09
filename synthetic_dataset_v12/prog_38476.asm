; DESCRIPTION: Draws a blue rectangle at (254, 120) with width 42 and height 108.
; PLAN: r0=254(x), r1=120(y), r2=42(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 120
LDI r2, 42
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
