; DESCRIPTION: Renders a green box of size 94x18 starting at (114, 43).
; PLAN: r0=114(x), r1=43(y), r2=94(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 43
LDI r2, 94
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
