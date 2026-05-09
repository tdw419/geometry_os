; DESCRIPTION: Draws a red rectangle at (434, 1) with width 44 and height 63.
; PLAN: r0=434(x), r1=1(y), r2=44(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 1
LDI r2, 44
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
