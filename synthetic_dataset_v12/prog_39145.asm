; DESCRIPTION: Renders a black box of size 17x72 starting at (404, 78).
; PLAN: r0=404(x), r1=78(y), r2=17(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 78
LDI r2, 17
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
