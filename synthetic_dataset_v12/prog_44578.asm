; DESCRIPTION: Draws a yellow rectangle at (346, 131) with width 75 and height 25.
; PLAN: r0=346(x), r1=131(y), r2=75(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 131
LDI r2, 75
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
