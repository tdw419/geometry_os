; DESCRIPTION: Draws a green rectangle at (429, 171) with width 82 and height 80.
; PLAN: r0=429(x), r1=171(y), r2=82(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 171
LDI r2, 82
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
