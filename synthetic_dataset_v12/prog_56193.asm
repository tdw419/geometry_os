; DESCRIPTION: Draws a black rectangle at (145, 173) with width 85 and height 40.
; PLAN: r0=145(x), r1=173(y), r2=85(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 173
LDI r2, 85
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
