; DESCRIPTION: Draws a white rectangle at (450, 165) with width 46 and height 65.
; PLAN: r0=450(x), r1=165(y), r2=46(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 165
LDI r2, 46
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
