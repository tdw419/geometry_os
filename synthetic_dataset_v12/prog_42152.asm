; DESCRIPTION: Renders a black box of size 58x20 starting at (418, 185).
; PLAN: r0=418(x), r1=185(y), r2=58(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 185
LDI r2, 58
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
