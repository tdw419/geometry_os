; DESCRIPTION: Composite: Places a cyan 45x12 rectangle at position (190, 136) then Places a cyan line segment connecting (434, 214) to (147, 109).
; PLAN: r0=190(x), r1=136(y), r2=45(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x1), r6=214(y1), r7=147(x2), r8=109(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 136
LDI r2, 45
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 214
LDI r7, 147
LDI r8, 109
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
