; DESCRIPTION: Draws a cyan rectangle at (45, 27) with width 119 and height 113.
; PLAN: r0=45(x), r1=27(y), r2=119(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 27
LDI r2, 119
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
