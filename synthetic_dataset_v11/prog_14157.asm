; DESCRIPTION: Draws a white rectangle at (65, 124) with width 113 and height 82.
; PLAN: r0=65(x), r1=124(y), r2=113(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 124
LDI r2, 113
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
