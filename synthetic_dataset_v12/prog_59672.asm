; DESCRIPTION: Draws a cyan rectangle at (352, 17) with width 71 and height 92.
; PLAN: r0=352(x), r1=17(y), r2=71(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 17
LDI r2, 71
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
