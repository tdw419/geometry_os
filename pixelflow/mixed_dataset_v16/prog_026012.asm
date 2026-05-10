; DESCRIPTION: Draws a orange rectangle at (140, 50) with width 103 and height 57.
; PLAN: r0=140(x), r1=50(y), r2=103(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 50
LDI r2, 103
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
