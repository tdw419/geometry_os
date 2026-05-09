; DESCRIPTION: Renders a black box of size 23x110 starting at (404, 95).
; PLAN: r0=404(x), r1=95(y), r2=23(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 95
LDI r2, 23
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
