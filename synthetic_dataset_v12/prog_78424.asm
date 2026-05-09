; DESCRIPTION: Draws a cyan rectangle at (55, 101) with width 58 and height 82.
; PLAN: r0=55(x), r1=101(y), r2=58(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 101
LDI r2, 58
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
