; DESCRIPTION: Draws a yellow rectangle at (82, 170) with width 120 and height 64.
; PLAN: r0=82(x), r1=170(y), r2=120(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 170
LDI r2, 120
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
