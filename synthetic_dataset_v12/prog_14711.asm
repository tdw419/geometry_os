; DESCRIPTION: Draws a white rectangle at (202, 66) with width 27 and height 55.
; PLAN: r0=202(x), r1=66(y), r2=27(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 66
LDI r2, 27
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
