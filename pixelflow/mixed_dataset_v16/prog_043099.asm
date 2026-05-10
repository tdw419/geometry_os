; DESCRIPTION: Renders a white box of size 25x35 starting at (324, 83).
; PLAN: r0=324(x), r1=83(y), r2=25(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 83
LDI r2, 25
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
