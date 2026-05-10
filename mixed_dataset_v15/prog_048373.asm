; DESCRIPTION: Draws a white rectangle at (140, 44) with width 103 and height 82.
; PLAN: r0=140(x), r1=44(y), r2=103(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 44
LDI r2, 103
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
