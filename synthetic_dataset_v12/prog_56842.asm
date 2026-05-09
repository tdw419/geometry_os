; DESCRIPTION: Draws a cyan rectangle at (368, 68) with width 19 and height 75.
; PLAN: r0=368(x), r1=68(y), r2=19(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 68
LDI r2, 19
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
