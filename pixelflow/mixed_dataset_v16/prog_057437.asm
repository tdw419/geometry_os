; DESCRIPTION: Draws a blue rectangle at (154, 65) with width 82 and height 24.
; PLAN: r0=154(x), r1=65(y), r2=82(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 65
LDI r2, 82
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
