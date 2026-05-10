; DESCRIPTION: Composite: Sets a single cyan pixel at (46, 103) then Draws a purple line from (498, 193) to (156, 149) then Draws a yellow rectangle at (410, 43) with width 48 and height 98.
; PLAN: r0=46(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=498(x1), r6=193(y1), r7=156(x2), r8=149(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=43(y), r12=48(width), r13=98(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 498
LDI r6, 193
LDI r7, 156
LDI r8, 149
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 43
LDI r12, 48
LDI r13, 98
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
