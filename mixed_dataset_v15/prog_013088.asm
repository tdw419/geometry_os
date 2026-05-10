; DESCRIPTION: Renders a yellow box of size 48x107 starting at (391, 78).
; PLAN: r0=391(x), r1=78(y), r2=48(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 78
LDI r2, 48
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
