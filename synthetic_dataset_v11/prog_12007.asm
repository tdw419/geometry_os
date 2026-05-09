; DESCRIPTION: Renders a black box of size 116x113 starting at (84, 91).
; PLAN: r0=84(x), r1=91(y), r2=116(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 91
LDI r2, 116
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
