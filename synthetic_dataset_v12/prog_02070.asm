; DESCRIPTION: Renders a white box of size 50x70 starting at (71, 147).
; PLAN: r0=71(x), r1=147(y), r2=50(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 147
LDI r2, 50
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
