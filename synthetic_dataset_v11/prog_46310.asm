; DESCRIPTION: Draws a cyan rectangle at (1, 133) with width 113 and height 47.
; PLAN: r0=1(x), r1=133(y), r2=113(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 133
LDI r2, 113
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
