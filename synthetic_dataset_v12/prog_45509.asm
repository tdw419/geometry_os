; DESCRIPTION: Draws a cyan rectangle at (127, 60) with width 18 and height 76.
; PLAN: r0=127(x), r1=60(y), r2=18(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 60
LDI r2, 18
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
