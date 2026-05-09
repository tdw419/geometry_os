; DESCRIPTION: Draws a blue rectangle at (113, 33) with width 16 and height 112.
; PLAN: r0=113(x), r1=33(y), r2=16(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 33
LDI r2, 16
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
