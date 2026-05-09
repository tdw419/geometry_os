; DESCRIPTION: Draws a cyan rectangle at (154, 52) with width 25 and height 73.
; PLAN: r0=154(x), r1=52(y), r2=25(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 52
LDI r2, 25
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
