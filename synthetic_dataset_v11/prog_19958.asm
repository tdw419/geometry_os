; DESCRIPTION: Renders a yellow box of size 32x17 starting at (102, 211).
; PLAN: r0=102(x), r1=211(y), r2=32(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 211
LDI r2, 32
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
