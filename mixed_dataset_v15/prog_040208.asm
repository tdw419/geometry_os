; DESCRIPTION: Composite: Places a red line segment connecting (31, 200) to (121, 53) then Renders a black box of size 10x115 starting at (373, 6) then Places a blue dot at position (146, 66).
; PLAN: r0=31(x1), r1=200(y1), r2=121(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=6(y), r7=10(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=66(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 200
LDI r2, 121
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 6
LDI r7, 10
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 66
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
