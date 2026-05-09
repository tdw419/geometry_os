; DESCRIPTION: Renders a white box of size 110x85 starting at (190, 126).
; PLAN: r0=190(x), r1=126(y), r2=110(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 126
LDI r2, 110
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
