; DESCRIPTION: Renders a green box of size 60x32 starting at (289, 83).
; PLAN: r0=289(x), r1=83(y), r2=60(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 83
LDI r2, 60
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
