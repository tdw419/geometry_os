; DESCRIPTION: Composite: Creates a white circular shape at (62, 71) with radius 10 then Draws a white line from (228, 84) to (176, 220).
; PLAN: r0=62(x), r1=71(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x1), r6=84(y1), r7=176(x2), r8=220(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 71
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 84
LDI r7, 176
LDI r8, 220
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
