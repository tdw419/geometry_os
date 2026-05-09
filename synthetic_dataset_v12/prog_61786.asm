; DESCRIPTION: Renders a black box of size 110x50 starting at (82, 71).
; PLAN: r0=82(x), r1=71(y), r2=110(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 71
LDI r2, 110
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
