; DESCRIPTION: Renders a green box of size 13x46 starting at (252, 24).
; PLAN: r0=252(x), r1=24(y), r2=13(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 24
LDI r2, 13
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
