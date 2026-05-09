; DESCRIPTION: Draws a black rectangle at (15, 120) with width 120 and height 61.
; PLAN: r0=15(x), r1=120(y), r2=120(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 120
LDI r2, 120
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
