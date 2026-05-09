; DESCRIPTION: Renders a yellow box of size 38x111 starting at (72, 52).
; PLAN: r0=72(x), r1=52(y), r2=38(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 52
LDI r2, 38
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
