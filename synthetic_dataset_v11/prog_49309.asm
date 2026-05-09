; DESCRIPTION: Draws a cyan rectangle at (106, 58) with width 117 and height 56.
; PLAN: r0=106(x), r1=58(y), r2=117(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 58
LDI r2, 117
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
