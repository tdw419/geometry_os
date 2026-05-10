; DESCRIPTION: Draws a orange rectangle at (126, 21) with width 27 and height 46.
; PLAN: r0=126(x), r1=21(y), r2=27(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 21
LDI r2, 27
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
