; DESCRIPTION: Renders a green box of size 32x18 starting at (314, 91).
; PLAN: r0=314(x), r1=91(y), r2=32(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 91
LDI r2, 32
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
