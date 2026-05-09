; DESCRIPTION: Draws a orange rectangle at (341, 152) with width 74 and height 72.
; PLAN: r0=341(x), r1=152(y), r2=74(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 152
LDI r2, 74
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
