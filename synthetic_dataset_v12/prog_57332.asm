; DESCRIPTION: Renders a white box of size 81x83 starting at (113, 30).
; PLAN: r0=113(x), r1=30(y), r2=81(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 30
LDI r2, 81
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
