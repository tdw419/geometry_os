; DESCRIPTION: Draws a white rectangle at (46, 6) with width 82 and height 31.
; PLAN: r0=46(x), r1=6(y), r2=82(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 6
LDI r2, 82
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
