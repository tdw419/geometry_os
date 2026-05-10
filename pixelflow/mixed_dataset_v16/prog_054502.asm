; DESCRIPTION: Renders a yellow box of size 32x102 starting at (68, 144).
; PLAN: r0=68(x), r1=144(y), r2=32(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 144
LDI r2, 32
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
