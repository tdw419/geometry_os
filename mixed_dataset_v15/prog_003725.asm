; DESCRIPTION: Renders a yellow box of size 32x11 starting at (38, 196).
; PLAN: r0=38(x), r1=196(y), r2=32(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 196
LDI r2, 32
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
