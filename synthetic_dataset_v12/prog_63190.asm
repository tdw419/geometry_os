; DESCRIPTION: Renders a blue box of size 32x19 starting at (130, 150).
; PLAN: r0=130(x), r1=150(y), r2=32(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 150
LDI r2, 32
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
