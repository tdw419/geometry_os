; DESCRIPTION: Composite: Places a cyan line segment connecting (433, 83) to (26, 192) then Renders a magenta box of size 53x68 starting at (42, 123) then Sets a single magenta pixel at (494, 137).
; PLAN: r0=433(x1), r1=83(y1), r2=26(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=123(y), r7=53(width), r8=68(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=494(x), r11=137(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 433
LDI r1, 83
LDI r2, 26
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 123
LDI r7, 53
LDI r8, 68
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 137
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
