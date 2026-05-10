; DESCRIPTION: Draws a cyan rectangle at (55, 53) with width 27 and height 11.
; PLAN: r0=55(x), r1=53(y), r2=27(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 53
LDI r2, 27
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
