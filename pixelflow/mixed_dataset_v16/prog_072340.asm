; DESCRIPTION: Renders a black box of size 94x112 starting at (322, 126).
; PLAN: r0=322(x), r1=126(y), r2=94(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 126
LDI r2, 94
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
