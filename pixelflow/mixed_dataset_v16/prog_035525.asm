; DESCRIPTION: Renders a white box of size 114x113 starting at (311, 118).
; PLAN: r0=311(x), r1=118(y), r2=114(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 118
LDI r2, 114
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
