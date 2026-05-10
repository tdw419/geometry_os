; DESCRIPTION: Draws a cyan rectangle at (131, 44) with width 15 and height 113.
; PLAN: r0=131(x), r1=44(y), r2=15(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 44
LDI r2, 15
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
