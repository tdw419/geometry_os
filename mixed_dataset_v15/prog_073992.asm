; DESCRIPTION: Draws a green rectangle at (388, 205) with width 120 and height 39.
; PLAN: r0=388(x), r1=205(y), r2=120(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 205
LDI r2, 120
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
