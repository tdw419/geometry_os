; DESCRIPTION: Draws a yellow rectangle at (168, 82) with width 30 and height 84.
; PLAN: r0=168(x), r1=82(y), r2=30(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 82
LDI r2, 30
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
