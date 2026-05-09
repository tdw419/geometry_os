; DESCRIPTION: Renders a yellow box of size 16x96 starting at (192, 134).
; PLAN: r0=192(x), r1=134(y), r2=16(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 134
LDI r2, 16
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
