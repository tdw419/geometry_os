; DESCRIPTION: Draws a blue rectangle at (168, 126) with width 42 and height 117.
; PLAN: r0=168(x), r1=126(y), r2=42(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 126
LDI r2, 42
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
