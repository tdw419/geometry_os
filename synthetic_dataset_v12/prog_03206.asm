; DESCRIPTION: Draws a green rectangle at (103, 131) with width 120 and height 25.
; PLAN: r0=103(x), r1=131(y), r2=120(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 131
LDI r2, 120
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
