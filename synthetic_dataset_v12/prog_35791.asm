; DESCRIPTION: Draws a yellow rectangle at (140, 166) with width 42 and height 42.
; PLAN: r0=140(x), r1=166(y), r2=42(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 166
LDI r2, 42
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
