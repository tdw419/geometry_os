; DESCRIPTION: Draws a magenta rectangle at (293, 82) with width 50 and height 59.
; PLAN: r0=293(x), r1=82(y), r2=50(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 82
LDI r2, 50
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
