; DESCRIPTION: Renders a green box of size 13x113 starting at (306, 99).
; PLAN: r0=306(x), r1=99(y), r2=13(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 99
LDI r2, 13
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
