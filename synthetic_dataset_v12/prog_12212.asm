; DESCRIPTION: Renders a yellow box of size 31x63 starting at (274, 177).
; PLAN: r0=274(x), r1=177(y), r2=31(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 177
LDI r2, 31
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
