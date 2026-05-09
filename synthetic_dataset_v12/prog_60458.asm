; DESCRIPTION: Renders a black box of size 111x12 starting at (215, 71).
; PLAN: r0=215(x), r1=71(y), r2=111(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 71
LDI r2, 111
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
