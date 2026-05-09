; DESCRIPTION: Renders a yellow box of size 20x61 starting at (170, 128).
; PLAN: r0=170(x), r1=128(y), r2=20(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 128
LDI r2, 20
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
