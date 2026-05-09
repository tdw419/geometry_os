; DESCRIPTION: Renders a yellow box of size 90x91 starting at (261, 144).
; PLAN: r0=261(x), r1=144(y), r2=90(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 144
LDI r2, 90
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
