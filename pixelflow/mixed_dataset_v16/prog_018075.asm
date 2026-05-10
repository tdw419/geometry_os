; DESCRIPTION: Composite: Renders a cyan line between points (402, 29) and (167, 246) then Places a blue dot at position (261, 133).
; PLAN: r0=402(x1), r1=29(y1), r2=167(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=133(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 29
LDI r2, 167
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 133
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
