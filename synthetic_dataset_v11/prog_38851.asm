; DESCRIPTION: Draws a red rectangle at (50, 26) with width 90 and height 98.
; PLAN: r0=50(x), r1=26(y), r2=90(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 26
LDI r2, 90
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
