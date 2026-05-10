; DESCRIPTION: Composite: Places a green line segment connecting (509, 129) to (276, 253) then Places a purple circle of radius 37 at center (269, 68).
; PLAN: r0=509(x1), r1=129(y1), r2=276(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=68(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 509
LDI r1, 129
LDI r2, 276
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 68
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
