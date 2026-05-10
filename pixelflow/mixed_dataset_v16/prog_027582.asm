; DESCRIPTION: Draws a red rectangle at (331, 66) with width 55 and height 32.
; PLAN: r0=331(x), r1=66(y), r2=55(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 66
LDI r2, 55
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
