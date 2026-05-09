; DESCRIPTION: Draws a white rectangle at (163, 191) with width 86 and height 64.
; PLAN: r0=163(x), r1=191(y), r2=86(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 191
LDI r2, 86
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
