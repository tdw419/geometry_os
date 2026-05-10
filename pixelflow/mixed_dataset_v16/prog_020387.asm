; DESCRIPTION: Renders a green box of size 58x21 starting at (282, 32).
; PLAN: r0=282(x), r1=32(y), r2=58(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 32
LDI r2, 58
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
