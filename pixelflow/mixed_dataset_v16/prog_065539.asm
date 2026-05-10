; DESCRIPTION: Renders a blue box of size 49x98 starting at (50, 70).
; PLAN: r0=50(x), r1=70(y), r2=49(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 70
LDI r2, 49
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
