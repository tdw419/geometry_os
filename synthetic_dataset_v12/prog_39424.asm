; DESCRIPTION: Draws a red rectangle at (456, 205) with width 37 and height 19.
; PLAN: r0=456(x), r1=205(y), r2=37(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 205
LDI r2, 37
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
