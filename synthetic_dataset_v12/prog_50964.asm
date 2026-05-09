; DESCRIPTION: Renders a green box of size 26x14 starting at (421, 125).
; PLAN: r0=421(x), r1=125(y), r2=26(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 125
LDI r2, 26
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
