; DESCRIPTION: Draws a blue rectangle at (93, 40) with width 42 and height 102.
; PLAN: r0=93(x), r1=40(y), r2=42(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 40
LDI r2, 42
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
