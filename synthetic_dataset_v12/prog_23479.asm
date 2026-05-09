; DESCRIPTION: Composite: Places a red line segment connecting (6, 147) to (22, 110) then Places a white 72x12 rectangle at position (174, 192).
; PLAN: r0=6(x1), r1=147(y1), r2=22(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=192(y), r7=72(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 147
LDI r2, 22
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 192
LDI r7, 72
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
