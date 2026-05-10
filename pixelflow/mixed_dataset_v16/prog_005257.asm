; DESCRIPTION: Draws a orange rectangle at (300, 21) with width 29 and height 71.
; PLAN: r0=300(x), r1=21(y), r2=29(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 21
LDI r2, 29
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
