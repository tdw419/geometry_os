; DESCRIPTION: Composite: Renders a magenta line between points (197, 254) and (430, 118) then Places a magenta 98x85 rectangle at position (60, 153) then Sets a single cyan pixel at (239, 218).
; PLAN: r0=197(x1), r1=254(y1), r2=430(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=153(y), r7=98(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=218(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 254
LDI r2, 430
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 153
LDI r7, 98
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 218
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
