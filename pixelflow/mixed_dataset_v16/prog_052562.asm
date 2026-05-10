; DESCRIPTION: Renders a green rectangular region spanning 64 by 33 at (247, 0).
; PLAN: r0=247(x), r1=0(y), r2=64(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 0
LDI r2, 64
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
