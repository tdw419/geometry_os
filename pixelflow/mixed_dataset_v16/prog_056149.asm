; DESCRIPTION: Draws a cyan rectangle at (4, 164) with width 52 and height 55.
; PLAN: r0=4(x), r1=164(y), r2=52(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 164
LDI r2, 52
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
