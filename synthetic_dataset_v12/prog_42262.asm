; DESCRIPTION: Composite: Places a red 77x76 rectangle at position (192, 143) then Places a blue line segment connecting (87, 177) to (170, 73) then Places a yellow dot at position (27, 207).
; PLAN: r0=192(x), r1=143(y), r2=77(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=177(y1), r7=170(x2), r8=73(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=207(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 192
LDI r1, 143
LDI r2, 77
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 177
LDI r7, 170
LDI r8, 73
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 207
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
