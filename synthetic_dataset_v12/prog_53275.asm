; DESCRIPTION: Renders a green box of size 65x112 starting at (372, 43).
; PLAN: r0=372(x), r1=43(y), r2=65(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 43
LDI r2, 65
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
