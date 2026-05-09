; DESCRIPTION: Renders a black box of size 21x111 starting at (208, 57).
; PLAN: r0=208(x), r1=57(y), r2=21(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 57
LDI r2, 21
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
