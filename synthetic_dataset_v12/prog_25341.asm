; DESCRIPTION: Draws a red rectangle at (239, 89) with width 91 and height 93.
; PLAN: r0=239(x), r1=89(y), r2=91(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 89
LDI r2, 91
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
