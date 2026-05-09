; DESCRIPTION: Draws a cyan rectangle at (421, 56) with width 11 and height 59.
; PLAN: r0=421(x), r1=56(y), r2=11(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 56
LDI r2, 11
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
