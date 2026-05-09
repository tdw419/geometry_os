; DESCRIPTION: Draws a yellow rectangle at (111, 22) with width 42 and height 82.
; PLAN: r0=111(x), r1=22(y), r2=42(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 22
LDI r2, 42
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
