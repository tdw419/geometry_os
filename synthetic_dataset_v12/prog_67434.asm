; DESCRIPTION: Draws a black rectangle at (245, 191) with width 120 and height 24.
; PLAN: r0=245(x), r1=191(y), r2=120(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 191
LDI r2, 120
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
