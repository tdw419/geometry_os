; DESCRIPTION: Draws a yellow rectangle at (259, 211) with width 61 and height 38.
; PLAN: r0=259(x), r1=211(y), r2=61(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 211
LDI r2, 61
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
