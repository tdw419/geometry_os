; DESCRIPTION: Composite: Draws a cyan line from (191, 207) to (495, 170) then Renders a red box of size 14x98 starting at (39, 77) then Places a yellow dot at position (71, 252).
; PLAN: r0=191(x1), r1=207(y1), r2=495(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=77(y), r7=14(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=252(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 207
LDI r2, 495
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 77
LDI r7, 14
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 252
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
