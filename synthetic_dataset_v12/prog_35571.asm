; DESCRIPTION: Composite: Renders a magenta line between points (457, 215) and (403, 29) then Sets a single black pixel at (507, 21).
; PLAN: r0=457(x1), r1=215(y1), r2=403(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=507(x), r6=21(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 215
LDI r2, 403
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 21
LDI r7, 0x000000
PSET r5, r6, r7
HALT
