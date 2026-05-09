; DESCRIPTION: Draws a white rectangle at (172, 32) with width 48 and height 117.
; PLAN: r0=172(x), r1=32(y), r2=48(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 32
LDI r2, 48
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
