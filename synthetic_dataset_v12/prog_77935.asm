; DESCRIPTION: Draws a red rectangle at (329, 32) with width 44 and height 75.
; PLAN: r0=329(x), r1=32(y), r2=44(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 32
LDI r2, 44
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
