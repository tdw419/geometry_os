; DESCRIPTION: Draws a yellow rectangle at (373, 8) with width 83 and height 82.
; PLAN: r0=373(x), r1=8(y), r2=83(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 8
LDI r2, 83
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
