; DESCRIPTION: Composite: Draws a white rectangle at (385, 34) with width 108 and height 72 then Places a magenta line segment connecting (12, 82) to (78, 95) then Sets a single cyan pixel at (502, 185).
; PLAN: r0=385(x), r1=34(y), r2=108(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=82(y1), r7=78(x2), r8=95(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=502(x), r11=185(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 385
LDI r1, 34
LDI r2, 108
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 82
LDI r7, 78
LDI r8, 95
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 185
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
