; DESCRIPTION: Composite: Renders a blue box of size 95x57 starting at (203, 25) then Places a orange line segment connecting (406, 215) to (444, 16) then Places a magenta dot at position (486, 192).
; PLAN: r0=203(x), r1=25(y), r2=95(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=215(y1), r7=444(x2), r8=16(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=486(x), r11=192(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 25
LDI r2, 95
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 215
LDI r7, 444
LDI r8, 16
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 192
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
