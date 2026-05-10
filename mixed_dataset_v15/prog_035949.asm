; DESCRIPTION: Composite: Places a orange line segment connecting (190, 205) to (450, 152) then Draws a cyan rectangle at (446, 8) with width 56 and height 84 then Places a red dot at position (170, 4).
; PLAN: r0=190(x1), r1=205(y1), r2=450(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=8(y), r7=56(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x), r11=4(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 205
LDI r2, 450
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 8
LDI r7, 56
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 4
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
