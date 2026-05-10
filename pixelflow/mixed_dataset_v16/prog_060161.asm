; DESCRIPTION: Draws a cyan rectangle at (354, 27) with width 19 and height 114.
; PLAN: r0=354(x), r1=27(y), r2=19(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 27
LDI r2, 19
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
