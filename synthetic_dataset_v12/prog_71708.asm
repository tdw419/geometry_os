; DESCRIPTION: Renders a yellow box of size 32x15 starting at (269, 106).
; PLAN: r0=269(x), r1=106(y), r2=32(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 106
LDI r2, 32
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
