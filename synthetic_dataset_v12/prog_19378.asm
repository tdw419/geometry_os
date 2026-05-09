; DESCRIPTION: Composite: Renders a blue line between points (504, 16) and (266, 106) then Creates a orange rectangular region at (298, 105) spanning 80 by 95 pixels then Places a white dot at position (215, 252).
; PLAN: r0=504(x1), r1=16(y1), r2=266(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=105(y), r7=80(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x), r11=252(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 504
LDI r1, 16
LDI r2, 266
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 105
LDI r7, 80
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 252
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
