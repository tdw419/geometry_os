; DESCRIPTION: Draws a cyan rectangle at (63, 96) with width 59 and height 78.
; PLAN: r0=63(x), r1=96(y), r2=59(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 96
LDI r2, 59
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
