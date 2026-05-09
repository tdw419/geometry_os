; DESCRIPTION: Draws a white rectangle at (156, 143) with width 79 and height 79.
; PLAN: r0=156(x), r1=143(y), r2=79(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 143
LDI r2, 79
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
