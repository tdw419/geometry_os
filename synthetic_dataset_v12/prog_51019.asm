; DESCRIPTION: Composite: Draws a green line from (264, 109) to (263, 133) then Places a orange 97x33 rectangle at position (245, 108) then Sets a single white pixel at (111, 84).
; PLAN: r0=264(x1), r1=109(y1), r2=263(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=108(y), r7=97(width), r8=33(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=84(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 109
LDI r2, 263
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 108
LDI r7, 97
LDI r8, 33
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 84
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
