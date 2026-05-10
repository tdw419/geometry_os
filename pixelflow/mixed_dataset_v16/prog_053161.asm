; DESCRIPTION: Renders a blue box of size 42x119 starting at (241, 91).
; PLAN: r0=241(x), r1=91(y), r2=42(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 91
LDI r2, 42
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
