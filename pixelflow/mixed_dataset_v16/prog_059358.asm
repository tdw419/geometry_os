; DESCRIPTION: Renders a green box of size 111x116 starting at (287, 71).
; PLAN: r0=287(x), r1=71(y), r2=111(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 71
LDI r2, 111
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
