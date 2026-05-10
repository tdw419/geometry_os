; DESCRIPTION: Draws a red rectangle at (397, 63) with width 16 and height 109.
; PLAN: r0=397(x), r1=63(y), r2=16(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 63
LDI r2, 16
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
