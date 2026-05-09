; DESCRIPTION: Composite: Draws a red line from (435, 203) to (70, 190) then Renders a green box of size 16x19 starting at (264, 11) then Places a white dot at position (368, 126).
; PLAN: r0=435(x1), r1=203(y1), r2=70(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=11(y), r7=16(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x), r11=126(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 203
LDI r2, 70
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 11
LDI r7, 16
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 126
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
