; DESCRIPTION: Renders a yellow box of size 111x63 starting at (172, 69).
; PLAN: r0=172(x), r1=69(y), r2=111(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 69
LDI r2, 111
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
