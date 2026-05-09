; DESCRIPTION: Renders a black box of size 90x65 starting at (379, 176).
; PLAN: r0=379(x), r1=176(y), r2=90(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 176
LDI r2, 90
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
