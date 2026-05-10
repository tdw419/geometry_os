; DESCRIPTION: Draws a cyan rectangle at (153, 65) with width 58 and height 58.
; PLAN: r0=153(x), r1=65(y), r2=58(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 65
LDI r2, 58
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
