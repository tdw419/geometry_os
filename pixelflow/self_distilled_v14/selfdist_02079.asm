; DESCRIPTION: Draws a yellow rectangle at (14, 44) with width 16 and height 77.
; PLAN: r0=14(x), r1=44(y), r2=16(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 44
LDI r2, 16
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
