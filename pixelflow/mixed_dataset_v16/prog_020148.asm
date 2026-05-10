; DESCRIPTION: Renders a white box of size 58x90 starting at (147, 76).
; PLAN: r0=147(x), r1=76(y), r2=58(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 76
LDI r2, 58
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
