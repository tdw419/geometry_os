; DESCRIPTION: Renders a green box of size 40x71 starting at (469, 71).
; PLAN: r0=469(x), r1=71(y), r2=40(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 71
LDI r2, 40
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
