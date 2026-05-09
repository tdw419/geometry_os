; DESCRIPTION: Draws a blue rectangle at (23, 112) with width 82 and height 64.
; PLAN: r0=23(x), r1=112(y), r2=82(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 112
LDI r2, 82
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
