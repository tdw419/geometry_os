; DESCRIPTION: Renders a black box of size 83x111 starting at (29, 42).
; PLAN: r0=29(x), r1=42(y), r2=83(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 42
LDI r2, 83
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
