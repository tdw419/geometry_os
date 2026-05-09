; DESCRIPTION: Composite: Sets a single cyan pixel at (28, 22) then Draws a cyan rectangle at (182, 137) with width 46 and height 86 then Renders a magenta line between points (228, 13) and (248, 187).
; PLAN: r0=28(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=137(y), r7=46(width), r8=86(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x1), r11=13(y1), r12=248(x2), r13=187(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 182
LDI r6, 137
LDI r7, 46
LDI r8, 86
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 13
LDI r12, 248
LDI r13, 187
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
