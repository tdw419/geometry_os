; DESCRIPTION: Renders a green box of size 110x29 starting at (113, 71).
; PLAN: r0=113(x), r1=71(y), r2=110(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 71
LDI r2, 110
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
