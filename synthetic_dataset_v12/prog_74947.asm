; DESCRIPTION: Draws a orange rectangle at (398, 116) with width 28 and height 47.
; PLAN: r0=398(x), r1=116(y), r2=28(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 116
LDI r2, 28
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
