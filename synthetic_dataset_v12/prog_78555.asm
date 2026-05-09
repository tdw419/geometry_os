; DESCRIPTION: Places a black 109x91 rectangle at position (351, 137).
; PLAN: r0=351(x), r1=137(y), r2=109(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 137
LDI r2, 109
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
