; DESCRIPTION: Composite: Creates a cyan rectangular region at (122, 38) spanning 68 by 117 pixels then Places a black dot at position (439, 8) then Draws a yellow line from (221, 56) to (190, 27).
; PLAN: r0=122(x), r1=38(y), r2=68(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=8(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=221(x1), r11=56(y1), r12=190(x2), r13=27(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 38
LDI r2, 68
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 8
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 221
LDI r11, 56
LDI r12, 190
LDI r13, 27
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
