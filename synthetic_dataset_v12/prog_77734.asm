; DESCRIPTION: Renders a blue box of size 32x86 starting at (375, 93).
; PLAN: r0=375(x), r1=93(y), r2=32(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 93
LDI r2, 32
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
