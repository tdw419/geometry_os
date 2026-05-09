; DESCRIPTION: Draws a white rectangle at (185, 126) with width 93 and height 26.
; PLAN: r0=185(x), r1=126(y), r2=93(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 126
LDI r2, 93
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
