; DESCRIPTION: Renders a yellow box of size 90x31 starting at (321, 185).
; PLAN: r0=321(x), r1=185(y), r2=90(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 185
LDI r2, 90
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
