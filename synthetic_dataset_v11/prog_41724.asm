; DESCRIPTION: Draws a white rectangle at (182, 1) with width 27 and height 50.
; PLAN: r0=182(x), r1=1(y), r2=27(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 1
LDI r2, 27
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
