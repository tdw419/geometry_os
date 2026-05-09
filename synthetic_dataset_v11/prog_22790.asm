; DESCRIPTION: Draws a red rectangle at (16, 214) with width 49 and height 19.
; PLAN: r0=16(x), r1=214(y), r2=49(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 214
LDI r2, 49
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
