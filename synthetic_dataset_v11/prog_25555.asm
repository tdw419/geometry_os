; DESCRIPTION: Renders a black box of size 89x111 starting at (99, 50).
; PLAN: r0=99(x), r1=50(y), r2=89(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 50
LDI r2, 89
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
