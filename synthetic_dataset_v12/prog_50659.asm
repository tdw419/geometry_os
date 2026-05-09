; DESCRIPTION: Draws a cyan rectangle at (54, 57) with width 92 and height 69.
; PLAN: r0=54(x), r1=57(y), r2=92(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 57
LDI r2, 92
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
