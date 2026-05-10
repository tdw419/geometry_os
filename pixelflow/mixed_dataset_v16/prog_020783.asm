; DESCRIPTION: Renders a black box of size 64x111 starting at (18, 54).
; PLAN: r0=18(x), r1=54(y), r2=64(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 54
LDI r2, 64
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
