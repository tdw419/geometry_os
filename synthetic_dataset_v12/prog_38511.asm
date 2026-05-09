; DESCRIPTION: Composite: Sets a single yellow pixel at (164, 45) then Renders a cyan box of size 26x17 starting at (178, 205) then Renders a magenta line between points (457, 169) and (406, 68).
; PLAN: r0=164(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=205(y), r7=26(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=457(x1), r11=169(y1), r12=406(x2), r13=68(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 178
LDI r6, 205
LDI r7, 26
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 169
LDI r12, 406
LDI r13, 68
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
