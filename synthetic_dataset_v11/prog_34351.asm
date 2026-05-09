; DESCRIPTION: Draws a yellow rectangle at (152, 125) with width 46 and height 113.
; PLAN: r0=152(x), r1=125(y), r2=46(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 125
LDI r2, 46
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
