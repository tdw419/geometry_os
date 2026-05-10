; DESCRIPTION: Draws a blue rectangle at (214, 42) with width 33 and height 47.
; PLAN: r0=214(x), r1=42(y), r2=33(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 42
LDI r2, 33
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
