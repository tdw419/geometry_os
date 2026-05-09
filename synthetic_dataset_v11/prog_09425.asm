; DESCRIPTION: Draws a red rectangle at (156, 56) with width 37 and height 32.
; PLAN: r0=156(x), r1=56(y), r2=37(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 56
LDI r2, 37
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
