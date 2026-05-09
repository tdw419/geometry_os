; DESCRIPTION: Renders a green box of size 85x32 starting at (141, 137).
; PLAN: r0=141(x), r1=137(y), r2=85(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 137
LDI r2, 85
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
