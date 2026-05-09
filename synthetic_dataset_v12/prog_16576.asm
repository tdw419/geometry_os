; DESCRIPTION: Composite: Places a magenta line segment connecting (2, 60) to (393, 207) then Places a red 14x16 rectangle at position (444, 44) then Sets a single purple pixel at (346, 49).
; PLAN: r0=2(x1), r1=60(y1), r2=393(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=44(y), r7=14(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=49(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 60
LDI r2, 393
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 44
LDI r7, 14
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 49
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
