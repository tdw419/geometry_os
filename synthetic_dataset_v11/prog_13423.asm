; DESCRIPTION: Renders a green box of size 37x37 starting at (83, 42).
; PLAN: r0=83(x), r1=42(y), r2=37(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 42
LDI r2, 37
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
