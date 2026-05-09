; DESCRIPTION: Composite: Renders a cyan line between points (43, 82) and (382, 245) then Places a purple circle of radius 36 at center (123, 177).
; PLAN: r0=43(x1), r1=82(y1), r2=382(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=177(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 82
LDI r2, 382
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 177
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
