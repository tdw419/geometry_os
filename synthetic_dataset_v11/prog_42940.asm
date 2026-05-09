; DESCRIPTION: Draws a cyan rectangle at (78, 27) with width 16 and height 65.
; PLAN: r0=78(x), r1=27(y), r2=16(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 27
LDI r2, 16
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
