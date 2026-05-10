; DESCRIPTION: Draws a green rectangle at (156, 7) with width 42 and height 92.
; PLAN: r0=156(x), r1=7(y), r2=42(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 7
LDI r2, 42
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
