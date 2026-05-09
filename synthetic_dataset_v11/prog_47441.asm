; DESCRIPTION: Draws a orange rectangle at (135, 177) with width 46 and height 30.
; PLAN: r0=135(x), r1=177(y), r2=46(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 177
LDI r2, 46
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
