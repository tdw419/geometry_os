; DESCRIPTION: Draws a red rectangle at (397, 190) with width 16 and height 26.
; PLAN: r0=397(x), r1=190(y), r2=16(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 190
LDI r2, 16
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
