; DESCRIPTION: Draws a orange rectangle at (243, 70) with width 113 and height 47.
; PLAN: r0=243(x), r1=70(y), r2=113(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 70
LDI r2, 113
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
