; DESCRIPTION: Composite: Places a green line segment connecting (501, 155) to (225, 231) then Sets a single cyan pixel at (45, 41) then Creates a white rectangular region at (295, 132) spanning 46 by 39 pixels.
; PLAN: r0=501(x1), r1=155(y1), r2=225(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=132(y), r12=46(width), r13=39(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 155
LDI r2, 225
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 295
LDI r11, 132
LDI r12, 46
LDI r13, 39
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
