; DESCRIPTION: Draws a cyan rectangle at (97, 131) with width 113 and height 82.
; PLAN: r0=97(x), r1=131(y), r2=113(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 131
LDI r2, 113
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
