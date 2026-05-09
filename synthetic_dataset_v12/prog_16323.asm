; DESCRIPTION: Renders a white box of size 61x62 starting at (418, 147).
; PLAN: r0=418(x), r1=147(y), r2=61(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 147
LDI r2, 61
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
