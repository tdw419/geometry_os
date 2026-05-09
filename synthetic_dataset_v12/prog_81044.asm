; DESCRIPTION: Draws a magenta rectangle at (83, 107) with width 91 and height 16.
; PLAN: r0=83(x), r1=107(y), r2=91(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 107
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
