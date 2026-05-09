; DESCRIPTION: Renders a white box of size 81x58 starting at (152, 147).
; PLAN: r0=152(x), r1=147(y), r2=81(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 147
LDI r2, 81
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
