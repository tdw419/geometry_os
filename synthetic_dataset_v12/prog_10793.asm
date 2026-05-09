; DESCRIPTION: Draws a yellow rectangle at (276, 205) with width 32 and height 34.
; PLAN: r0=276(x), r1=205(y), r2=32(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 205
LDI r2, 32
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
