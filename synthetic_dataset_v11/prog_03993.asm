; DESCRIPTION: Draws a red rectangle at (80, 21) with width 108 and height 60.
; PLAN: r0=80(x), r1=21(y), r2=108(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 21
LDI r2, 108
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
