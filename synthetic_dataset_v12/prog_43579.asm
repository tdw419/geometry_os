; DESCRIPTION: Draws a yellow rectangle at (221, 198) with width 74 and height 42.
; PLAN: r0=221(x), r1=198(y), r2=74(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 198
LDI r2, 74
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
