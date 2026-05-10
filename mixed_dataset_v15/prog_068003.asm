; DESCRIPTION: Composite: Places a green dot at position (71, 224) then Draws a cyan line from (186, 196) to (327, 38) then Creates a cyan rectangular region at (475, 26) spanning 13 by 54 pixels.
; PLAN: r0=71(x), r1=224(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=196(y1), r7=327(x2), r8=38(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=475(x), r11=26(y), r12=13(width), r13=54(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 224
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 186
LDI r6, 196
LDI r7, 327
LDI r8, 38
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 26
LDI r12, 13
LDI r13, 54
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
