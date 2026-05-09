; DESCRIPTION: Renders a purple box of size 100x48 starting at (123, 40).
; PLAN: r0=123(x), r1=40(y), r2=100(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 40
LDI r2, 100
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
