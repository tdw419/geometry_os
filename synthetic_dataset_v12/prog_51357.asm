; DESCRIPTION: Composite: Renders a cyan line between points (84, 61) and (362, 83) then Places a yellow dot at position (220, 47) then Creates a cyan rectangular region at (15, 105) spanning 109 by 24 pixels.
; PLAN: r0=84(x1), r1=61(y1), r2=362(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=47(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=105(y), r12=109(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 61
LDI r2, 362
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 47
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 15
LDI r11, 105
LDI r12, 109
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
