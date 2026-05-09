; DESCRIPTION: Composite: Renders a green box of size 49x25 starting at (10, 42) then Renders a yellow line between points (446, 237) and (33, 190) then Sets a single red pixel at (418, 91).
; PLAN: r0=10(x), r1=42(y), r2=49(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=237(y1), r7=33(x2), r8=190(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=91(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 10
LDI r1, 42
LDI r2, 49
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 237
LDI r7, 33
LDI r8, 190
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 91
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
