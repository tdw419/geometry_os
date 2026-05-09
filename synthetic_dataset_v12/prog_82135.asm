; DESCRIPTION: Draws a white rectangle at (48, 31) with width 58 and height 21.
; PLAN: r0=48(x), r1=31(y), r2=58(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 31
LDI r2, 58
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
