; DESCRIPTION: Renders a yellow box of size 16x13 starting at (56, 30).
; PLAN: r0=56(x), r1=30(y), r2=16(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 30
LDI r2, 16
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
