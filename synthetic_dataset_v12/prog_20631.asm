; DESCRIPTION: Renders a yellow box of size 40x36 starting at (1, 50).
; PLAN: r0=1(x), r1=50(y), r2=40(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 50
LDI r2, 40
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
