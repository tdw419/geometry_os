; DESCRIPTION: Draws a cyan rectangle at (314, 163) with width 106 and height 65.
; PLAN: r0=314(x), r1=163(y), r2=106(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 163
LDI r2, 106
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
