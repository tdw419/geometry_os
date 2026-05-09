; DESCRIPTION: Composite: Draws a green line from (458, 41) to (8, 190) then Places a red 76x117 rectangle at position (218, 15) then Renders a green disk with center (448, 150) and radius 32.
; PLAN: r0=458(x1), r1=41(y1), r2=8(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=15(y), r7=76(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=448(x), r11=150(y), r12=32(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 41
LDI r2, 8
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 15
LDI r7, 76
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 150
LDI r12, 32
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
