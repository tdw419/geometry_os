; DESCRIPTION: Draws a cyan rectangle at (395, 160) with width 10 and height 55.
; PLAN: r0=395(x), r1=160(y), r2=10(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 160
LDI r2, 10
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
