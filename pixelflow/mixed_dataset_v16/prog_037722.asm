; DESCRIPTION: Composite: Places a white dot at position (132, 105) then Draws a cyan line from (83, 223) to (456, 229) then Creates a red rectangular region at (245, 188) spanning 116 by 46 pixels.
; PLAN: r0=132(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=83(x1), r6=223(y1), r7=456(x2), r8=229(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=188(y), r12=116(width), r13=46(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 223
LDI r7, 456
LDI r8, 229
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 188
LDI r12, 116
LDI r13, 46
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
