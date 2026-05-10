; DESCRIPTION: Renders a black box of size 56x23 starting at (351, 207).
; PLAN: r0=351(x), r1=207(y), r2=56(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 207
LDI r2, 56
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
