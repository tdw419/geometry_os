; DESCRIPTION: Draws a red rectangle at (75, 6) with width 32 and height 44.
; PLAN: r0=75(x), r1=6(y), r2=32(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 6
LDI r2, 32
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
