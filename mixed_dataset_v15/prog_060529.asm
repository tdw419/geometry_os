; DESCRIPTION: Renders a white box of size 113x118 starting at (152, 25).
; PLAN: r0=152(x), r1=25(y), r2=113(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 25
LDI r2, 113
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
