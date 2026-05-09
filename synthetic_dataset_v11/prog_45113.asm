; DESCRIPTION: Draws a orange rectangle at (173, 130) with width 58 and height 113.
; PLAN: r0=173(x), r1=130(y), r2=58(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 130
LDI r2, 58
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
