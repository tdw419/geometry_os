; DESCRIPTION: Renders a green rectangular region spanning 42 by 76 at (10, 110).
; PLAN: r0=10(x), r1=110(y), r2=42(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 110
LDI r2, 42
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
