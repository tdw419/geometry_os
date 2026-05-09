; DESCRIPTION: Draws a yellow rectangle at (408, 16) with width 65 and height 85.
; PLAN: r0=408(x), r1=16(y), r2=65(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 16
LDI r2, 65
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
