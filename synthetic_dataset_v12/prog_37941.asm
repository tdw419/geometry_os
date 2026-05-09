; DESCRIPTION: Renders a green box of size 83x76 starting at (245, 136).
; PLAN: r0=245(x), r1=136(y), r2=83(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 136
LDI r2, 83
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
