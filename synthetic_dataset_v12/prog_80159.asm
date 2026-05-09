; DESCRIPTION: Renders a yellow box of size 50x57 starting at (177, 145).
; PLAN: r0=177(x), r1=145(y), r2=50(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 145
LDI r2, 50
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
