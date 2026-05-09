; DESCRIPTION: Draws a red rectangle at (58, 98) with width 12 and height 44.
; PLAN: r0=58(x), r1=98(y), r2=12(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 98
LDI r2, 12
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
