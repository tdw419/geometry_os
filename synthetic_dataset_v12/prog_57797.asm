; DESCRIPTION: Composite: Places a green line segment connecting (168, 74) to (509, 58) then Draws a purple rectangle at (377, 190) with width 89 and height 64 then Places a red dot at position (427, 245).
; PLAN: r0=168(x1), r1=74(y1), r2=509(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=190(y), r7=89(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x), r11=245(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 74
LDI r2, 509
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 190
LDI r7, 89
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 245
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
