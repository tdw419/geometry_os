; DESCRIPTION: Draws a cyan rectangle at (5, 28) with width 18 and height 80.
; PLAN: r0=5(x), r1=28(y), r2=18(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 28
LDI r2, 18
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
