; DESCRIPTION: Draws a green rectangle at (156, 33) with width 39 and height 103.
; PLAN: r0=156(x), r1=33(y), r2=39(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 33
LDI r2, 39
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
