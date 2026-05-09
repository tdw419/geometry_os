; DESCRIPTION: Draws a black rectangle at (165, 55) with width 95 and height 120.
; PLAN: r0=165(x), r1=55(y), r2=95(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 55
LDI r2, 95
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
