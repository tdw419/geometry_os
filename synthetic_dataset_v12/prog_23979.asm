; DESCRIPTION: Renders a white box of size 118x117 starting at (374, 11).
; PLAN: r0=374(x), r1=11(y), r2=118(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 11
LDI r2, 118
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
