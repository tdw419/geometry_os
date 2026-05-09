; DESCRIPTION: Draws a red rectangle at (46, 102) with width 90 and height 60.
; PLAN: r0=46(x), r1=102(y), r2=90(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 102
LDI r2, 90
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
