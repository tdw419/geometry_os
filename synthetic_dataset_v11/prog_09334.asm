; DESCRIPTION: Renders a purple box of size 91x113 starting at (114, 108).
; PLAN: r0=114(x), r1=108(y), r2=91(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 108
LDI r2, 91
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
