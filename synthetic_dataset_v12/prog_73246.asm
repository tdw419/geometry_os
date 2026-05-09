; DESCRIPTION: Draws a white rectangle at (305, 71) with width 34 and height 106.
; PLAN: r0=305(x), r1=71(y), r2=34(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 71
LDI r2, 34
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
