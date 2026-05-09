; DESCRIPTION: Draws a red rectangle at (156, 44) with width 70 and height 20.
; PLAN: r0=156(x), r1=44(y), r2=70(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 44
LDI r2, 70
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
