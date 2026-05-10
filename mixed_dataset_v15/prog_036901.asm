; DESCRIPTION: Renders a yellow box of size 76x73 starting at (320, 129).
; PLAN: r0=320(x), r1=129(y), r2=76(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 129
LDI r2, 76
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
