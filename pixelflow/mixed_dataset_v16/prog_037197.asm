; DESCRIPTION: Renders a yellow box of size 72x83 starting at (414, 109).
; PLAN: r0=414(x), r1=109(y), r2=72(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 109
LDI r2, 72
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
