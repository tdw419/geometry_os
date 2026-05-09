; DESCRIPTION: Renders a green box of size 33x80 starting at (289, 124).
; PLAN: r0=289(x), r1=124(y), r2=33(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 124
LDI r2, 33
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
