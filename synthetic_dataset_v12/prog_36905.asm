; DESCRIPTION: Renders a yellow box of size 23x91 starting at (443, 17).
; PLAN: r0=443(x), r1=17(y), r2=23(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 17
LDI r2, 23
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
