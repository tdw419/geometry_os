; DESCRIPTION: Draws a black rectangle at (21, 223) with width 57 and height 30.
; PLAN: r0=21(x), r1=223(y), r2=57(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 223
LDI r2, 57
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
