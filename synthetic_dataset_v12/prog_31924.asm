; DESCRIPTION: Draws a orange rectangle at (352, 133) with width 32 and height 26.
; PLAN: r0=352(x), r1=133(y), r2=32(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 133
LDI r2, 32
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
