; DESCRIPTION: Renders a green box of size 83x10 starting at (206, 189).
; PLAN: r0=206(x), r1=189(y), r2=83(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 189
LDI r2, 83
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
