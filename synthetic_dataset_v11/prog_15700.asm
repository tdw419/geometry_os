; DESCRIPTION: Renders a white box of size 107x110 starting at (81, 126).
; PLAN: r0=81(x), r1=126(y), r2=107(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 126
LDI r2, 107
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
