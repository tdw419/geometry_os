; DESCRIPTION: Draws a red rectangle at (80, 50) with width 91 and height 83.
; PLAN: r0=80(x), r1=50(y), r2=91(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 50
LDI r2, 91
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
