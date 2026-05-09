; DESCRIPTION: Draws a red rectangle at (120, 5) with width 21 and height 77.
; PLAN: r0=120(x), r1=5(y), r2=21(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 5
LDI r2, 21
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
