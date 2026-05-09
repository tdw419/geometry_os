; DESCRIPTION: Renders a black box of size 68x111 starting at (18, 140).
; PLAN: r0=18(x), r1=140(y), r2=68(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 140
LDI r2, 68
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
