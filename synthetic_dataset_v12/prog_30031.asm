; DESCRIPTION: Draws a red rectangle at (212, 82) with width 113 and height 103.
; PLAN: r0=212(x), r1=82(y), r2=113(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 82
LDI r2, 113
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
