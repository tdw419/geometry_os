; DESCRIPTION: Composite: Renders a purple box of size 85x12 starting at (248, 180) then Places a cyan line segment connecting (176, 29) to (405, 60) then Sets a single magenta pixel at (66, 229).
; PLAN: r0=248(x), r1=180(y), r2=85(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x1), r6=29(y1), r7=405(x2), r8=60(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=229(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 180
LDI r2, 85
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 29
LDI r7, 405
LDI r8, 60
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 229
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
