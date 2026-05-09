; DESCRIPTION: Draws a cyan rectangle at (81, 80) with width 107 and height 100.
; PLAN: r0=81(x), r1=80(y), r2=107(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 80
LDI r2, 107
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
