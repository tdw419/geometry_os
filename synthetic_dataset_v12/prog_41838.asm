; DESCRIPTION: Draws a yellow rectangle at (236, 215) with width 81 and height 13.
; PLAN: r0=236(x), r1=215(y), r2=81(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 215
LDI r2, 81
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
