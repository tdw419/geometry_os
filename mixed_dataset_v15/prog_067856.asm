; DESCRIPTION: Places a yellow 78x63 rectangle at position (289, 109).
; PLAN: r0=289(x), r1=109(y), r2=78(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 109
LDI r2, 78
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
