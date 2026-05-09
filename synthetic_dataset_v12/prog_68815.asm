; DESCRIPTION: Draws a red rectangle at (77, 206) with width 65 and height 37.
; PLAN: r0=77(x), r1=206(y), r2=65(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 206
LDI r2, 65
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
