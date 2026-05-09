; DESCRIPTION: Draws a orange rectangle at (369, 209) with width 103 and height 47.
; PLAN: r0=369(x), r1=209(y), r2=103(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 209
LDI r2, 103
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
