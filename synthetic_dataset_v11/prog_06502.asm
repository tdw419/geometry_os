; DESCRIPTION: Renders a green box of size 36x117 starting at (116, 114).
; PLAN: r0=116(x), r1=114(y), r2=36(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 114
LDI r2, 36
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
