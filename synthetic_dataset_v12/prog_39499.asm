; DESCRIPTION: Renders a yellow box of size 12x34 starting at (46, 0).
; PLAN: r0=46(x), r1=0(y), r2=12(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 0
LDI r2, 12
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
