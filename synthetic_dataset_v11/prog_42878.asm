; DESCRIPTION: Draws a cyan rectangle at (117, 87) with width 92 and height 15.
; PLAN: r0=117(x), r1=87(y), r2=92(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 87
LDI r2, 92
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
