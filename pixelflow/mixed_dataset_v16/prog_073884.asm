; DESCRIPTION: Draws a orange rectangle at (413, 149) with width 39 and height 98.
; PLAN: r0=413(x), r1=149(y), r2=39(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 149
LDI r2, 39
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
