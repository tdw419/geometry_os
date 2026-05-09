; DESCRIPTION: Draws a yellow rectangle at (212, 143) with width 103 and height 98.
; PLAN: r0=212(x), r1=143(y), r2=103(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 143
LDI r2, 103
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
