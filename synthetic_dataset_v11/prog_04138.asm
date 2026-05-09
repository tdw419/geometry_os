; DESCRIPTION: Renders a black box of size 108x91 starting at (125, 12).
; PLAN: r0=125(x), r1=12(y), r2=108(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 12
LDI r2, 108
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
