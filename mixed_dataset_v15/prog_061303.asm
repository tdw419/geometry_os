; DESCRIPTION: Renders a green box of size 39x107 starting at (54, 65).
; PLAN: r0=54(x), r1=65(y), r2=39(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 65
LDI r2, 39
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
