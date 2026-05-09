; DESCRIPTION: Renders a green box of size 71x83 starting at (125, 65).
; PLAN: r0=125(x), r1=65(y), r2=71(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 65
LDI r2, 71
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
