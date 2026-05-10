; DESCRIPTION: Draws a blue rectangle at (242, 133) with width 95 and height 78.
; PLAN: r0=242(x), r1=133(y), r2=95(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 133
LDI r2, 95
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
