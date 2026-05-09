; DESCRIPTION: Draws a red rectangle at (156, 82) with width 66 and height 89.
; PLAN: r0=156(x), r1=82(y), r2=66(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 82
LDI r2, 66
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
