; DESCRIPTION: Renders a yellow box of size 64x33 starting at (85, 38).
; PLAN: r0=85(x), r1=38(y), r2=64(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 38
LDI r2, 64
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
