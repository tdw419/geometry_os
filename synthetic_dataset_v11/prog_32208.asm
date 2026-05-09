; DESCRIPTION: Renders a yellow box of size 45x100 starting at (143, 38).
; PLAN: r0=143(x), r1=38(y), r2=45(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 38
LDI r2, 45
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
