; DESCRIPTION: Draws a red rectangle at (8, 214) with width 13 and height 25.
; PLAN: r0=8(x), r1=214(y), r2=13(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 214
LDI r2, 13
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
