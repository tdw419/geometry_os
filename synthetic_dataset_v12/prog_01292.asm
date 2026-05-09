; DESCRIPTION: Renders a green box of size 83x28 starting at (28, 48).
; PLAN: r0=28(x), r1=48(y), r2=83(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 48
LDI r2, 83
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
