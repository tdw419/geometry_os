; DESCRIPTION: Renders a blue box of size 50x19 starting at (68, 48).
; PLAN: r0=68(x), r1=48(y), r2=50(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 48
LDI r2, 50
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
