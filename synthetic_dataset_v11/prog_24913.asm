; DESCRIPTION: Renders a yellow box of size 80x107 starting at (30, 72).
; PLAN: r0=30(x), r1=72(y), r2=80(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 72
LDI r2, 80
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
