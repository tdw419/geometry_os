; DESCRIPTION: Draws a black rectangle at (96, 93) with width 111 and height 68.
; PLAN: r0=96(x), r1=93(y), r2=111(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 93
LDI r2, 111
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
