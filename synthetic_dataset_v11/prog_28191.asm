; DESCRIPTION: Draws a yellow rectangle at (15, 93) with width 82 and height 103.
; PLAN: r0=15(x), r1=93(y), r2=82(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 93
LDI r2, 82
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
