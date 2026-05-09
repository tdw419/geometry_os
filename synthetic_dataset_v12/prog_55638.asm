; DESCRIPTION: Renders a blue box of size 42x15 starting at (270, 91).
; PLAN: r0=270(x), r1=91(y), r2=42(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 91
LDI r2, 42
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
