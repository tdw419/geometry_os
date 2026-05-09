; DESCRIPTION: Renders a yellow box of size 111x24 starting at (340, 149).
; PLAN: r0=340(x), r1=149(y), r2=111(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 149
LDI r2, 111
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
