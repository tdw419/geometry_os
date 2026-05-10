; DESCRIPTION: Renders a green box of size 48x60 starting at (289, 129).
; PLAN: r0=289(x), r1=129(y), r2=48(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 129
LDI r2, 48
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
