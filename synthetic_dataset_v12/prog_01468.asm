; DESCRIPTION: Draws a orange rectangle at (245, 7) with width 64 and height 71.
; PLAN: r0=245(x), r1=7(y), r2=64(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 7
LDI r2, 64
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
