; DESCRIPTION: Draws a red rectangle at (361, 98) with width 83 and height 91.
; PLAN: r0=361(x), r1=98(y), r2=83(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 98
LDI r2, 83
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
