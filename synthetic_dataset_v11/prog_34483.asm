; DESCRIPTION: Draws a blue rectangle at (59, 42) with width 55 and height 48.
; PLAN: r0=59(x), r1=42(y), r2=55(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 42
LDI r2, 55
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
