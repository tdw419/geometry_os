; DESCRIPTION: Renders a blue box of size 58x40 starting at (42, 21).
; PLAN: r0=42(x), r1=21(y), r2=58(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 21
LDI r2, 58
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
