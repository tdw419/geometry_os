; DESCRIPTION: Draws a white rectangle at (93, 107) with width 91 and height 32.
; PLAN: r0=93(x), r1=107(y), r2=91(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 107
LDI r2, 91
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
