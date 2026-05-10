; DESCRIPTION: Composite: Places a blue 76x86 rectangle at position (373, 112) then Renders a purple line between points (427, 69) and (275, 49).
; PLAN: r0=373(x), r1=112(y), r2=76(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x1), r6=69(y1), r7=275(x2), r8=49(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 112
LDI r2, 76
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 69
LDI r7, 275
LDI r8, 49
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
