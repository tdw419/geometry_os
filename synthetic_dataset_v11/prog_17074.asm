; DESCRIPTION: Renders a white box of size 84x17 starting at (151, 178).
; PLAN: r0=151(x), r1=178(y), r2=84(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 178
LDI r2, 84
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
