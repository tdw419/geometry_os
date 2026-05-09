; DESCRIPTION: Draws a orange rectangle at (179, 120) with width 59 and height 63.
; PLAN: r0=179(x), r1=120(y), r2=59(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 120
LDI r2, 59
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
