; DESCRIPTION: Draws a orange rectangle at (94, 151) with width 120 and height 63.
; PLAN: r0=94(x), r1=151(y), r2=120(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 151
LDI r2, 120
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
