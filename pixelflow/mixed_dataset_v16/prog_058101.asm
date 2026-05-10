; DESCRIPTION: Renders a yellow box of size 64x50 starting at (78, 34).
; PLAN: r0=78(x), r1=34(y), r2=64(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 34
LDI r2, 64
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
