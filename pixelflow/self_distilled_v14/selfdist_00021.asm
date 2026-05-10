; DESCRIPTION: Draws a blue rectangle at (373, 50) with width 42 and height 58.
; PLAN: r0=373(x), r1=50(y), r2=42(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 50
LDI r2, 42
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
