; DESCRIPTION: Composite: Renders a blue line between points (66, 101) and (392, 85) then Places a cyan 52x80 rectangle at position (139, 109).
; PLAN: r0=66(x1), r1=101(y1), r2=392(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=109(y), r7=52(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 101
LDI r2, 392
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 109
LDI r7, 52
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
