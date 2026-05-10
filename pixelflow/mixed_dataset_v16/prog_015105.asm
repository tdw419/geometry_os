; DESCRIPTION: Renders a yellow box of size 82x49 starting at (35, 205).
; PLAN: r0=35(x), r1=205(y), r2=82(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 205
LDI r2, 82
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
