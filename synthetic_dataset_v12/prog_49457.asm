; DESCRIPTION: Composite: Places a red 80x58 rectangle at position (220, 83) then Places a cyan line segment connecting (375, 243) to (489, 177) then Places a cyan dot at position (252, 109).
; PLAN: r0=220(x), r1=83(y), r2=80(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=243(y1), r7=489(x2), r8=177(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=109(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 83
LDI r2, 80
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 243
LDI r7, 489
LDI r8, 177
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 109
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
