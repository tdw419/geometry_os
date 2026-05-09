; DESCRIPTION: Composite: Places a white 11x68 rectangle at position (369, 65) then Renders a black line between points (97, 6) and (336, 149).
; PLAN: r0=369(x), r1=65(y), r2=11(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x1), r6=6(y1), r7=336(x2), r8=149(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 65
LDI r2, 11
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 6
LDI r7, 336
LDI r8, 149
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
