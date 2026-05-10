; DESCRIPTION: Draws a cyan rectangle at (69, 109) with width 110 and height 92.
; PLAN: r0=69(x), r1=109(y), r2=110(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 109
LDI r2, 110
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
