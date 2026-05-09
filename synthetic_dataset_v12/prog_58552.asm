; DESCRIPTION: Renders a blue box of size 76x86 starting at (375, 17).
; PLAN: r0=375(x), r1=17(y), r2=76(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 17
LDI r2, 76
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
