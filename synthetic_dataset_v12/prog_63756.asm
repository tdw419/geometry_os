; DESCRIPTION: Draws a white rectangle at (242, 88) with width 57 and height 99.
; PLAN: r0=242(x), r1=88(y), r2=57(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 88
LDI r2, 57
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
