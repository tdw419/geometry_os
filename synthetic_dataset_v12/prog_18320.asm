; DESCRIPTION: Draws a yellow rectangle at (245, 78) with width 48 and height 120.
; PLAN: r0=245(x), r1=78(y), r2=48(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 78
LDI r2, 48
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
