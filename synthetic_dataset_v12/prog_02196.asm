; DESCRIPTION: Draws a cyan rectangle at (113, 7) with width 80 and height 49.
; PLAN: r0=113(x), r1=7(y), r2=80(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 7
LDI r2, 80
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
