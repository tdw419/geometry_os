; DESCRIPTION: Draws a red rectangle at (417, 211) with width 83 and height 25.
; PLAN: r0=417(x), r1=211(y), r2=83(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 211
LDI r2, 83
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
