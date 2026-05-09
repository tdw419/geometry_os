; DESCRIPTION: Renders a yellow box of size 111x65 starting at (52, 63).
; PLAN: r0=52(x), r1=63(y), r2=111(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 63
LDI r2, 111
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
