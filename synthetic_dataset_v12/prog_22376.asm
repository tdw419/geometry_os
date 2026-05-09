; DESCRIPTION: Draws a cyan rectangle at (81, 125) with width 20 and height 16.
; PLAN: r0=81(x), r1=125(y), r2=20(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 125
LDI r2, 20
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
