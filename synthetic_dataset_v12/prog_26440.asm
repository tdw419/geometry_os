; DESCRIPTION: Draws a yellow rectangle at (308, 77) with width 71 and height 31.
; PLAN: r0=308(x), r1=77(y), r2=71(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 77
LDI r2, 71
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
