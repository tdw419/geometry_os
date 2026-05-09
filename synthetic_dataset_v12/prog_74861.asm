; DESCRIPTION: Composite: Places a cyan line segment connecting (362, 13) to (68, 204) then Renders a cyan disk with center (195, 192) and radius 62.
; PLAN: r0=362(x1), r1=13(y1), r2=68(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=192(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 362
LDI r1, 13
LDI r2, 68
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 192
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
