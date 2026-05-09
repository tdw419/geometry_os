; DESCRIPTION: Draws a yellow rectangle at (415, 179) with width 34 and height 16.
; PLAN: r0=415(x), r1=179(y), r2=34(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 179
LDI r2, 34
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
