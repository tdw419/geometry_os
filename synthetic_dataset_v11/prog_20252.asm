; DESCRIPTION: Renders a white box of size 111x107 starting at (118, 99).
; PLAN: r0=118(x), r1=99(y), r2=111(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 99
LDI r2, 111
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
