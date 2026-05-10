; DESCRIPTION: Draws a red rectangle at (354, 161) with width 75 and height 44.
; PLAN: r0=354(x), r1=161(y), r2=75(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 161
LDI r2, 75
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
