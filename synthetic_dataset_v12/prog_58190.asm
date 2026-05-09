; DESCRIPTION: Composite: Renders a yellow line between points (14, 192) and (308, 224) then Places a magenta dot at position (432, 67).
; PLAN: r0=14(x1), r1=192(y1), r2=308(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=67(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 14
LDI r1, 192
LDI r2, 308
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 67
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
