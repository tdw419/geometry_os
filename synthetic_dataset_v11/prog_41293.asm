; DESCRIPTION: Draws a blue rectangle at (168, 127) with width 70 and height 28.
; PLAN: r0=168(x), r1=127(y), r2=70(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 127
LDI r2, 70
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
