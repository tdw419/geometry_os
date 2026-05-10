; DESCRIPTION: Draws a magenta rectangle at (380, 131) with width 83 and height 50.
; PLAN: r0=380(x), r1=131(y), r2=83(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 131
LDI r2, 83
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
