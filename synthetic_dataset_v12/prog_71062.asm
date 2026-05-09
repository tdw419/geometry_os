; DESCRIPTION: Draws a cyan rectangle at (245, 2) with width 78 and height 96.
; PLAN: r0=245(x), r1=2(y), r2=78(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 2
LDI r2, 78
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
