; DESCRIPTION: Renders a blue box of size 25x116 starting at (170, 126).
; PLAN: r0=170(x), r1=126(y), r2=25(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 126
LDI r2, 25
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
