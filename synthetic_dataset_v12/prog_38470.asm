; DESCRIPTION: Renders a yellow box of size 98x20 starting at (24, 25).
; PLAN: r0=24(x), r1=25(y), r2=98(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 25
LDI r2, 98
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
