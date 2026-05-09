; DESCRIPTION: Draws a purple rectangle at (16, 98) with width 40 and height 59.
; PLAN: r0=16(x), r1=98(y), r2=40(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 98
LDI r2, 40
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
