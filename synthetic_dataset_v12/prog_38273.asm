; DESCRIPTION: Draws a green rectangle at (342, 171) with width 65 and height 76.
; PLAN: r0=342(x), r1=171(y), r2=65(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 171
LDI r2, 65
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
