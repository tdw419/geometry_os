; DESCRIPTION: Draws a black rectangle at (300, 0) with width 118 and height 42.
; PLAN: r0=300(x), r1=0(y), r2=118(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 0
LDI r2, 118
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
