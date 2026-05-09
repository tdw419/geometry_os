; DESCRIPTION: Renders a white box of size 25x12 starting at (108, 118).
; PLAN: r0=108(x), r1=118(y), r2=25(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 118
LDI r2, 25
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
