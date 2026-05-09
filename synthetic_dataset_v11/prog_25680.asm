; DESCRIPTION: Draws a cyan rectangle at (10, 98) with width 22 and height 95.
; PLAN: r0=10(x), r1=98(y), r2=22(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 98
LDI r2, 22
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
