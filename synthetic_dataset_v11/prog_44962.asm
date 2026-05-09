; DESCRIPTION: Draws a white rectangle at (73, 168) with width 50 and height 84.
; PLAN: r0=73(x), r1=168(y), r2=50(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 168
LDI r2, 50
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
