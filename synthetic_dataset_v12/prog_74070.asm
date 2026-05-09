; DESCRIPTION: Composite: Creates a cyan circular shape at (213, 147) with radius 16 then Draws a green line from (295, 101) to (375, 106).
; PLAN: r0=213(x), r1=147(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x1), r6=101(y1), r7=375(x2), r8=106(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 147
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 101
LDI r7, 375
LDI r8, 106
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
