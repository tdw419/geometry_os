; DESCRIPTION: Renders a yellow box of size 34x48 starting at (351, 173).
; PLAN: r0=351(x), r1=173(y), r2=34(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 173
LDI r2, 34
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
