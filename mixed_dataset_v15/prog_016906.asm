; DESCRIPTION: Draws a cyan rectangle at (333, 100) with width 25 and height 37.
; PLAN: r0=333(x), r1=100(y), r2=25(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 100
LDI r2, 25
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
