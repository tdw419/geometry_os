; DESCRIPTION: Renders a white box of size 19x84 starting at (153, 57).
; PLAN: r0=153(x), r1=57(y), r2=19(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 57
LDI r2, 19
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
