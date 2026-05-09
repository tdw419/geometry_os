; DESCRIPTION: Draws a green rectangle at (66, 48) with width 82 and height 60.
; PLAN: r0=66(x), r1=48(y), r2=82(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 48
LDI r2, 82
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
