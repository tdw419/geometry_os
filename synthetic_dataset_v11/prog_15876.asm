; DESCRIPTION: Renders a white box of size 120x81 starting at (4, 39).
; PLAN: r0=4(x), r1=39(y), r2=120(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 39
LDI r2, 120
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
