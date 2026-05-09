; DESCRIPTION: Composite: Places a green dot at position (181, 243) then Renders a orange line between points (380, 71) and (405, 144) then Creates a white rectangular region at (25, 44) spanning 62 by 27 pixels.
; PLAN: r0=181(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x1), r6=71(y1), r7=405(x2), r8=144(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=25(x), r11=44(y), r12=62(width), r13=27(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 71
LDI r7, 405
LDI r8, 144
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 44
LDI r12, 62
LDI r13, 27
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
