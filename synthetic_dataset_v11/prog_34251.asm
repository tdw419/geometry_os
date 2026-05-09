; DESCRIPTION: Renders a white box of size 48x118 starting at (7, 83).
; PLAN: r0=7(x), r1=83(y), r2=48(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 83
LDI r2, 48
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
