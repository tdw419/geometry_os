; DESCRIPTION: Composite: Renders a purple box of size 99x80 starting at (380, 55) then Renders a white line between points (137, 75) and (432, 91) then Places a red dot at position (421, 174).
; PLAN: r0=380(x), r1=55(y), r2=99(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x1), r6=75(y1), r7=432(x2), r8=91(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=174(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 55
LDI r2, 99
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 75
LDI r7, 432
LDI r8, 91
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 174
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
