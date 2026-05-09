; DESCRIPTION: Draws a red rectangle at (246, 143) with width 77 and height 34.
; PLAN: r0=246(x), r1=143(y), r2=77(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 143
LDI r2, 77
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
