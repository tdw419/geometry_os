; DESCRIPTION: Draws a black rectangle at (40, 93) with width 91 and height 49.
; PLAN: r0=40(x), r1=93(y), r2=91(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 93
LDI r2, 91
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
