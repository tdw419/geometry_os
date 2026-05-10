; DESCRIPTION: Draws a orange rectangle at (446, 178) with width 16 and height 47.
; PLAN: r0=446(x), r1=178(y), r2=16(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 178
LDI r2, 16
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
