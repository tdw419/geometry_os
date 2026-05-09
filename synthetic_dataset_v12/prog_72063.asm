; DESCRIPTION: Draws a black rectangle at (240, 150) with width 50 and height 31.
; PLAN: r0=240(x), r1=150(y), r2=50(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 150
LDI r2, 50
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
