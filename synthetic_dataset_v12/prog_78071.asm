; DESCRIPTION: Draws a red rectangle at (375, 38) with width 60 and height 120.
; PLAN: r0=375(x), r1=38(y), r2=60(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 38
LDI r2, 60
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
