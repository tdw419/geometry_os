; DESCRIPTION: Renders a green box of size 19x25 starting at (122, 60).
; PLAN: r0=122(x), r1=60(y), r2=19(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 60
LDI r2, 19
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
