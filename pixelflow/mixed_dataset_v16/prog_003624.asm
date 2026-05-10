; DESCRIPTION: Composite: Places a blue 91x49 rectangle at position (82, 52) then Renders a orange line between points (87, 236) and (98, 108) then Places a magenta dot at position (54, 243).
; PLAN: r0=82(x), r1=52(y), r2=91(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=236(y1), r7=98(x2), r8=108(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=243(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 52
LDI r2, 91
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 236
LDI r7, 98
LDI r8, 108
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 243
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
