; DESCRIPTION: Renders a black box of size 80x111 starting at (240, 50).
; PLAN: r0=240(x), r1=50(y), r2=80(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 50
LDI r2, 80
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
