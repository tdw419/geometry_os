; DESCRIPTION: Renders a yellow box of size 57x76 starting at (351, 83).
; PLAN: r0=351(x), r1=83(y), r2=57(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 83
LDI r2, 57
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
