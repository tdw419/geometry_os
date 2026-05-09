; DESCRIPTION: Draws a cyan rectangle at (449, 143) with width 59 and height 81.
; PLAN: r0=449(x), r1=143(y), r2=59(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 143
LDI r2, 59
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
