; DESCRIPTION: Draws a red rectangle at (393, 122) with width 85 and height 48.
; PLAN: r0=393(x), r1=122(y), r2=85(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 122
LDI r2, 85
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
