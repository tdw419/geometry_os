; DESCRIPTION: Draws a blue rectangle at (42, 164) with width 59 and height 55.
; PLAN: r0=42(x), r1=164(y), r2=59(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 164
LDI r2, 59
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
