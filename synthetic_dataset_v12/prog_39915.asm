; DESCRIPTION: Renders a black box of size 54x12 starting at (158, 235).
; PLAN: r0=158(x), r1=235(y), r2=54(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 235
LDI r2, 54
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
