; DESCRIPTION: Draws a red rectangle at (266, 16) with width 82 and height 79.
; PLAN: r0=266(x), r1=16(y), r2=82(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 16
LDI r2, 82
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
