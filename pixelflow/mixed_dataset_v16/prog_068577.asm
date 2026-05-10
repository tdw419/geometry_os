; DESCRIPTION: Draws a yellow rectangle at (398, 179) with width 26 and height 72.
; PLAN: r0=398(x), r1=179(y), r2=26(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 179
LDI r2, 26
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
