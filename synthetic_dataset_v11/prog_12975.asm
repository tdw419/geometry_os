; DESCRIPTION: Draws a white rectangle at (149, 124) with width 68 and height 56.
; PLAN: r0=149(x), r1=124(y), r2=68(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 124
LDI r2, 68
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
