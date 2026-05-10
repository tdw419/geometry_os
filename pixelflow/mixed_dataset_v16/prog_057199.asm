; DESCRIPTION: Draws a orange rectangle at (48, 58) with width 46 and height 118.
; PLAN: r0=48(x), r1=58(y), r2=46(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 58
LDI r2, 46
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
