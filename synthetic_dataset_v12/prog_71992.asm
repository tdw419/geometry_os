; DESCRIPTION: Renders a green box of size 101x28 starting at (178, 118).
; PLAN: r0=178(x), r1=118(y), r2=101(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 118
LDI r2, 101
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
