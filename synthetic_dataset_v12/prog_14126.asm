; DESCRIPTION: Composite: Renders a cyan line between points (122, 223) and (281, 225) then Sets a single cyan pixel at (469, 152) then Creates a yellow rectangular region at (160, 108) spanning 16 by 82 pixels.
; PLAN: r0=122(x1), r1=223(y1), r2=281(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=152(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=108(y), r12=16(width), r13=82(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 223
LDI r2, 281
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 152
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 160
LDI r11, 108
LDI r12, 16
LDI r13, 82
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
