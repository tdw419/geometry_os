; DESCRIPTION: Renders a white box of size 17x27 starting at (175, 88).
; PLAN: r0=175(x), r1=88(y), r2=17(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 88
LDI r2, 17
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
