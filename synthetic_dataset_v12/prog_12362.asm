; DESCRIPTION: Renders a yellow box of size 16x38 starting at (93, 1).
; PLAN: r0=93(x), r1=1(y), r2=16(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 1
LDI r2, 16
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
