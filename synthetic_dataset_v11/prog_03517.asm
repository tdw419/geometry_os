; DESCRIPTION: Renders a black box of size 50x28 starting at (193, 147).
; PLAN: r0=193(x), r1=147(y), r2=50(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 147
LDI r2, 50
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
