; DESCRIPTION: Renders a yellow box of size 13x48 starting at (297, 1).
; PLAN: r0=297(x), r1=1(y), r2=13(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 1
LDI r2, 13
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
