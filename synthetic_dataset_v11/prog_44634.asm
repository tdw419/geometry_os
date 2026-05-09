; DESCRIPTION: Renders a yellow box of size 31x105 starting at (169, 143).
; PLAN: r0=169(x), r1=143(y), r2=31(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 143
LDI r2, 31
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
