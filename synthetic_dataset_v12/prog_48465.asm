; DESCRIPTION: Renders a yellow box of size 34x29 starting at (340, 199).
; PLAN: r0=340(x), r1=199(y), r2=34(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 199
LDI r2, 34
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
