; DESCRIPTION: Renders a white box of size 94x71 starting at (106, 114).
; PLAN: r0=106(x), r1=114(y), r2=94(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 114
LDI r2, 94
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
