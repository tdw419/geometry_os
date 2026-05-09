; DESCRIPTION: Renders a white box of size 49x109 starting at (326, 135).
; PLAN: r0=326(x), r1=135(y), r2=49(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 135
LDI r2, 49
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
