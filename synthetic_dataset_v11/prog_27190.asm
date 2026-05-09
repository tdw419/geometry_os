; DESCRIPTION: Draws a cyan rectangle at (83, 10) with width 58 and height 92.
; PLAN: r0=83(x), r1=10(y), r2=58(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 10
LDI r2, 58
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
