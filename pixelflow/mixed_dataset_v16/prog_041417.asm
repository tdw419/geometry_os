; DESCRIPTION: Draws a orange rectangle at (228, 14) with width 90 and height 21.
; PLAN: r0=228(x), r1=14(y), r2=90(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 14
LDI r2, 90
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
