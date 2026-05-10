; DESCRIPTION: Draws a black rectangle at (242, 38) with width 70 and height 13.
; PLAN: r0=242(x), r1=38(y), r2=70(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 38
LDI r2, 70
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
