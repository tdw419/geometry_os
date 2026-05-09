; DESCRIPTION: Renders a blue box of size 82x110 starting at (107, 40).
; PLAN: r0=107(x), r1=40(y), r2=82(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 40
LDI r2, 82
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
