; DESCRIPTION: Renders a yellow box of size 37x34 starting at (107, 28).
; PLAN: r0=107(x), r1=28(y), r2=37(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 28
LDI r2, 37
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
