; DESCRIPTION: Renders a purple box of size 56x11 starting at (188, 156).
; PLAN: r0=188(x), r1=156(y), r2=56(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 156
LDI r2, 56
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
