; DESCRIPTION: Renders a black box of size 105x78 starting at (404, 55).
; PLAN: r0=404(x), r1=55(y), r2=105(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 55
LDI r2, 105
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
