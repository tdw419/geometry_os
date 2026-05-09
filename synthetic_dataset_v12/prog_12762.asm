; DESCRIPTION: Draws a cyan rectangle at (341, 79) with width 79 and height 36.
; PLAN: r0=341(x), r1=79(y), r2=79(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 79
LDI r2, 79
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
