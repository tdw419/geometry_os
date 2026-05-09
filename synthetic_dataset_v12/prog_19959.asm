; DESCRIPTION: Draws a red rectangle at (272, 171) with width 25 and height 49.
; PLAN: r0=272(x), r1=171(y), r2=25(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 171
LDI r2, 25
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
