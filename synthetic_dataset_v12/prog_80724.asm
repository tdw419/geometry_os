; DESCRIPTION: Draws a black rectangle at (112, 75) with width 42 and height 102.
; PLAN: r0=112(x), r1=75(y), r2=42(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 75
LDI r2, 42
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
