; DESCRIPTION: Renders a purple box of size 23x50 starting at (76, 24).
; PLAN: r0=76(x), r1=24(y), r2=23(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 24
LDI r2, 23
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
