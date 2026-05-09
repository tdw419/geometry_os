; DESCRIPTION: Composite: Draws a green rectangle at (38, 67) with width 40 and height 20 then Sets a single white pixel at (18, 32).
; PLAN: r0=38(x), r1=67(y), r2=40(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=32(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 67
LDI r2, 40
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 32
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
